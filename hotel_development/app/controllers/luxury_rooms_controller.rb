class LuxuryRoomsController < ApplicationController

  def index

    @room_type= RoomTypeService.getRoomTypeLuxury

  end
  


  
end