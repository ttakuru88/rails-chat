class ChatChannel < ApplicationCable::Channel
  def subscribed
    @room = Room.find_by(name: params[:room_name])
    stream_for(@room) if @room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    case data['event']
    when 'speak'
      message = @room.messages.new(user_name: data['user_name'], text: data['message'])
      if message.save
        ChatChannel.broadcast_to(@room, {
          event: data['event'],
          message: message.to_response,
        })
      end
    when 'get_messages'
      revision = data['revision'].to_i

      messages = @room.messages.order(id: :asc).where('id > ?', revision)
      messages = messages.reorder(id: :desc).limit(25).reverse if revision.zero?

      transmit(event: 'messages', messages: messages.map(&:to_response))
    end
  end
end
