class SingleRoomsController < ApplicationController

  def index

    @room_type= RoomTypeService.getRoomTypeSingle

  end
  def create
    
  end
  


  
end
