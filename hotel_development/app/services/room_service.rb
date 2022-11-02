class RoomService

  class << self

    def getAllRooms

      @rooms = RoomRepository.getAllRooms

    end

    def createRoom(room)

     @is_room_create = RoomRepository.createRoom(room)

    end

    def getRoomByID(id)

      @room = RoomRepository.getRoomByID(id)

    end

    def updateRoom(room, room_params)

      @is_room_update = RoomRepository.updateRoom(room, room_params)

    end

    def destroyRoom(room)

      RoomRepository.destroyRoom(room)

    end

  end

end