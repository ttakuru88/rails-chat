class ChatChannel < ApplicationCable::Channel
  def subscribed
    @room = Room.find_by(name: params[:room_name])
    @room.touch
    stream_for(@room) if @room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = @room.messages.new(user_name: data['user_name'], text: data['message'])
    if message.save
      ChatChannel.broadcast_to(@room, {
        event: 'speak',
        message: message.to_response,
      })
      @room.touch
    end
  end

  def get_messages(data)
    revision = data['revision'].to_i

    messages = @room.messages.where('id > ?', revision)
    messages = messages.order(id: :desc).limit(25) if revision.zero?

    transmit(event: 'messages', messages: messages.map(&:to_response))
  end
end
