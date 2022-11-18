class DeluxeRoomsController < ApplicationController

  def index

    @room_type= RoomTypeService.getRoomTypeDeluxe

  end
  
end