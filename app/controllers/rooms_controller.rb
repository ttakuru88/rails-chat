class RoomsController < ApplicationController
  def index
    @rooms = load_rooms
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

  def safe_name_from_params
    params[:id].to_s[0...Room::NAME_LIMIT]
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
