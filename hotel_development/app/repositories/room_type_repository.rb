class RoomTypeRepository
  
  class << self
    
    def getAllRoomTypes

      @room_types = RoomType.all

    end

    def createRoomType(room_type)

      @is_room_type_create = room_type.save

    end

    def getRoomTypeByID(id)

      @room_type = RoomType.find(id)

    end

    def updateRoomType(room_type, room_type_params)

      @is_update_room_type = room_type.update(room_type_params)

    end

    def destroyRoomType(room_type)

      room_type.destroy

    end

  end

end