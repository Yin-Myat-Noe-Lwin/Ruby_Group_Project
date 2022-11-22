class RoomsController < ApplicationController

  before_action :ensure_admin

  def ensure_admin

    if !logged_in? || current_user.user_type == '1'
      #raise ActionController::RoutingError, 'Not Found'
      render 'admins/strict'
      
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

    respond_to do |format|

      @errorNum     = []

      @errorImg       = []

      @errorSize       = []

      @errorService1      = []

      @errorService2      = []

      @errorService3      = []

    if @is_room_create 

      format.js {render :js => "window.location.href='"+rooms_path+"'"}  

    else

     format.js

     if (@room.errors["room_num"] != nil)

      @errorNum.push(@room.errors["room_num"][0])

    end

    if (@room.errors["room_img"] != nil)

      @errorImg.push(@room.errors["room_img"][0])

    end

    if (@room.errors["size"] != nil)

      @errorSize.push(@room.errors["size"][0])

    end

    if (@room.errors["service1"] != nil)

      @errorService1.push(@room.errors["service1"][0])

    end

    if (@room.errors["service2"] != nil)

      @errorService2.push(@room.errors["service2"][0])

    end

    if (@room.errors["service3"] != nil)

      @errorService3.push(@room.errors["service3"][0])

    end

    end

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

    respond_to do |format|

      @errorNum     = []

      @errorSize       = []

      @errorService1      = []

      @errorService2      = []

      @errorService3      = []
    
    if @is_room_update

      format.js {render :js => "window.location.href='"+rooms_path+"'"}

    else

      format.js

      if (@room.errors["room_num"] != nil)

        @errorNum.push(@room.errors["room_num"][0])
  
      end

      if (@room.errors["size"] != nil)

        @errorSize.push(@room.errors["size"][0])
  
      end

      if (@room.errors["service1"] != nil)

        @errorService1.push(@room.errors["service1"][0])
  
      end
  
      if (@room.errors["service2"] != nil)
  
        @errorService2.push(@room.errors["service2"][0])
  
      end
  
      if (@room.errors["service3"] != nil)
  
        @errorService3.push(@room.errors["service3"][0])
  
      end
  
    end

  end

end

def destroy

  @room = RoomService.getRoomByID(params[:id])

  RoomService.destroyRoom(@room)

  respond_to do |format|

    format.js{render :js => "window.location.href='"+rooms_path+"'"}  
    
  end

end

def search
end

def showResults

  redirect_to reservations_path

end

private

  def room_params

    params.require(:room).permit(:room_num, :status, :room_img, :room_type_id , :size , :service1,  :service2,  :service3)
  
  end

  def update_room_params

    @upload = params[:room][:room_img]

    if (@upload)

      File.open( Rails.root.join('app/assets', 'images/rooms', @upload.original_filename), 'wb') do |file|
                
      file.write( @upload.read )

     params[:room][:room_img]=  "rooms/" + @upload.original_filename
        
      end

    end

    params.require(:room).permit(:room_num, :status, :room_img, :room_type_id , :size , :service1,  :service2,  :service3)
  
  end


end
