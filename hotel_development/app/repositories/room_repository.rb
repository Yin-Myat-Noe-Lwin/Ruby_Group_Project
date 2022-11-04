class RoomRepository
  
  class << self
    
    def getAllRooms

      @rooms = Room.all

    end

    def createRoom(room)

      @is_room_create = room.save

    end

    def getRoomByID(id)

      @room = Room.find(id)

    end

    def updateRoom(room, room_params)

      @is_update_room = room.update(room_params)

    end

    def destroyRoom(room)

      room.destroy

    end

  end

end