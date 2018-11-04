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
          message: {
            user_name: data['user_name'],
            text: data['message'],
            time: I18n.l(message.created_at),
          }
        })
      end
    end
  end
end
