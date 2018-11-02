class ChatChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find_by(name: params[:room_name])
    stream_for(room) if room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
