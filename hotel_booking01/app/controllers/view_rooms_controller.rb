class ViewRoomsController < ApplicationController
  
  def show
    @room_type = RoomTypeService.getRoomTypeByID(params[:id])
  end

end
