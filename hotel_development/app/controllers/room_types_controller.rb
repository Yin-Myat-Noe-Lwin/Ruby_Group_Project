class RoomTypesController < ApplicationController

  before_action :ensure_admin

  def ensure_admin

    if !logged_in? || current_user.user_type == '1'
      #raise ActionController::RoutingError, 'Not Found'
      render 'room_type_strict'
      
    end

  end

  def new

      @room_type = RoomType.new

  end

  def create

    @room_type = RoomType.new(room_type_params)

    @upload = params[:room_type][:room_type_img]

    if (@upload)

      File.open( Rails.root.join('app/assets', 'images/room_types', @upload.original_filename), 'wb') do |file|
                
      file.write( @upload.read )

      @room_type.room_type_img =  "room_types/" + @upload.original_filename
        
      end

    end

    @is_room_type_create = RoomTypeService.createRoomType(@room_type)

    if @is_room_type_create 

      flash.notice="Sign up successful"

      redirect_to dashboard_path

    else

      render 'new'

    end

  end

  def index
    @room_types = RoomTypeService.getAllRoomTypes
  end

  def show
    @room_type = RoomTypeService.getRoomTypeByID(params[:id])
  end

    def edit

      @room_type = RoomTypeService.getRoomTypeByID(params[:id])

    end

    def update

      @room_type = RoomTypeService.getRoomTypeByID(params[:id])
      
      @is_room_type_update = RoomTypeService.updateRoomType(@room_type, update_room_type_params )

      if @is_room_type_update

        redirect_to dashboard_path

      else

        flash.notice = "Something wrong"

      end

  end

  def destroy
    @room_type = RoomTypeService.getRoomTypeByID(params[:id])

    RoomTypeService.destroyRoomType(@room_type)
  end

  private 

  def room_type_params

    params.require(:room_type).permit(:name, :max_capacity, :room_type_img)
  
  end

  def update_room_type_params

    @upload = params[:room_type][:room_type_img]

    if (@upload)

      File.open( Rails.root.join('app/assets', 'images/room_types', @upload.original_filename), 'wb') do |file|
                
      file.write( @upload.read )

     params[:room_type][:room_type_img]=  "room_types/" + @upload.original_filename
        
      end

    end

    params.require(:room_type).permit(:name, :max_capacity, :room_type_img)
  
  end

end
