class RoomTypeService

  class << self

    def getAllRoomTypes

      @room_types = RoomTypeRepository.getAllRoomTypes

    end

    def createRoomType(room_type)

     @is_room_type_create = RoomTypeRepository.createRoomType(room_type)

    end

    def getRoomTypeByID(id)

      @room_type = RoomTypeRepository.getRoomTypeByID(id)

    end

    def updateRoomType(room_type, room_type_params)

      @is_room_type_update = RoomTypeRepository.updateRoomType(room_type, room_type_params)

    end

    def destroyRoomType(room_type)

      RoomTypeRepository.destroyRoomType(room_type)

    end
    
    def getRoomTypeSingle

      @room_type = RoomTypeRepository.getRoomTypeSingle

    end

    def getRoomTypeDouble

      @room_type = RoomTypeRepository.getRoomTypeDouble

    end

    def getRoomTypeLuxury

      @room_type = RoomTypeRepository.getRoomTypeLuxury

    end

    def getRoomTypeDeluxe

      @room_type = RoomTypeRepository.getRoomTypeDeluxe

    end
    
    def getRoomTypeSpecial

      @room_type = RoomTypeRepository.getRoomTypeSpecial

    end

  end

end