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
      ChatChannel.broadcast_to(@room, {
        event: data['event'],
        message: {
          text: data['message'],
          time: I18n.l(Time.current),
        }
      })
    end
  end
end
