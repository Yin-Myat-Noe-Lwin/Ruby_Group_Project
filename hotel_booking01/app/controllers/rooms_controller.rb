class RoomsController < ApplicationController

  before_action :ensure_admin

  def ensure_admin

    if !logged_in? || current_user.user_type == '1'
      #raise ActionController::RoutingError, 'Not Found'
      render 'room_strict'
      
    end

  end

  def new

    @room = Room.new

  end

  def create

    @room = Room.new(room_params)

    @upload = params[:room][:room_img]

    if (@upload)

      File.open( Rails.root.join('app/assets', 'images/rooms', @upload.original_filename), 'wb') do |file|
                
      file.write( @upload.read )

      @room.room_img =  "rooms/" + @upload.original_filename
        
      end

    end

    @is_room_create = RoomService.createRoom(@room)

    if @is_room_create 

      flash.notice="Sign up successful"

      redirect_to dashboard_path

    else

      render 'new'

    end

  end

  def index
    @rooms = RoomService.getAllRooms
  end

  def show
    @room = RoomService.getRoomByID(params[:id])
  end

  def edit

    @room = RoomService.getRoomByID(params[:id])

  end

  def update

    @room = RoomService.getRoomByID(params[:id])
    
    @is_room_update = RoomService.updateRoom(@room, update_room_params )

    if @is_room_update

      redirect_to dashboard_path

    else

      flash.notice = "Something wrong"

    end

end

def destroy
  @room = RoomService.getRoomByID(params[:id])

  RoomService.destroyRoom(@room)
end

  def room_params

    params.require(:room).permit(:room_num, :status, :room_img, :room_type_id)
  
  end

  def update_room_params

    @upload = params[:room][:room_img]

    if (@upload)

      File.open( Rails.root.join('app/assets', 'images/rooms', @upload.original_filename), 'wb') do |file|
                
      file.write( @upload.read )

     params[:room][:room_img]=  "rooms/" + @upload.original_filename
        
      end

    end

    params.require(:room).permit(:room_num, :status, :room_img, :room_type_id)
  
  end


end
