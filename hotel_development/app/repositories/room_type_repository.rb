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

    def getRoomTypeSingle

      @room_type = RoomType.find_by max_capacity: 1

    end

    def getRoomTypeDouble

      @room_type = RoomType.find_by max_capacity: 2

    end

    def getRoomTypeLuxury

      @room_type = RoomType.find_by name: "Luxury Room"

    end

    def getRoomTypeDeluxe

      @room_type = RoomType.find_by name: "Deluxe Room"

    end
    
    def getRoomTypeSpecial

      @room_type = RoomType.find_by name: "Special Room"

    end

  end

end