class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find_or_create_by(name: safe_name_from_params)
  end

  private

  def safe_name_from_params
    params[:id].to_s[0...Room::NAME_LIMIT]
  end
end
