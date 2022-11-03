class SingleRoomsController < ApplicationController

  def index

    @room_type= RoomTypeService.getRoomTypeSingle

  end
  


  
end
