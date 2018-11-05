class RoomCleaner
  def self.clean_deserted_rooms(rooms, number_of_users)
    rooms.each do |room|
      room.destroy if number_of_users[room.name].zero? && room.expired?
    end
  end
end
