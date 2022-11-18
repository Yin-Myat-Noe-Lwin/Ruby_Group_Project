class ViewRoomsController < ApplicationController
  
  def show

    if logged_in? &&  current_user.user_type == '0'

      render 'admins/strict'

    else

    @room_type = RoomTypeService.getRoomTypeByID(params[:id])

    end
    
  end
  
end
