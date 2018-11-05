class RoomsController < ApplicationController
  def index
    @rooms = load_rooms
    @number_of_users = load_room_users_count

    RoomCleaner.clean_deserted_rooms(@rooms, @number_of_users)
    @rooms.reload
  end

  def show
    @room = Room.find_or_create_by(name: safe_name_from_params)
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(id: @room.name)
    else
      @rooms = load_rooms
      render :index
    end
  end

  private

  def load_rooms
    Room.all
  end

  def load_room_users_count
    ActionCable
      .server
      .open_connections_statistics
      .flat_map { |con| con[:subscriptions].map { |s| JSON.parse(s)["room_name"] } }
      .inject(Hash.new(0)) { |counter, room_name| counter.tap { |h| counter[room_name] += 1 } }
  end

  def safe_name_from_params
    params[:id].to_s[0...Room::NAME_LIMIT]
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
