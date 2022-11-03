class SingleRoomsController < ApplicationController

  def index

    @room_type= RoomTypeService.getRoomType

  end
  


  
end
