class SpecialRoomsController < ApplicationController

  def index

    @room_type= RoomTypeService.getRoomTypeSpecial

  end
  


  
end
