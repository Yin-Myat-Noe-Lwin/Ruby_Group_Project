class DoubleRoomsController < ApplicationController

  def index

    @room_type= RoomTypeService.getRoomTypeDouble

  end
  
end
