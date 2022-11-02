class HomeController < ApplicationController
  
  before_action :check

  def check

    if logged_in?

    if current_user.user_type == '0' 

      #raise ActionController::RoutingError, 'Not Found'

      render 'logout_Page'

    end

  end

  end

  def homePage

    @room_types = RoomTypeService.getAllRoomTypes

  end

  def search

    @input_check_in = params[:check_in]

    @input_check_out = params[:check_out]

    @input_num_of_ppl = params[:num_of_ppl]

    @input_room_type_id = params[:room_type_id]

    @chosen_room_type = RoomType.find_by_id(@input_room_type_id)

    if @input_check_in.present? && @input_check_out.present? && @input_num_of_ppl.present? && @input_room_type_id.present?  &&  @input_check_out > @input_check_in && @input_check_in >= Time.now
      
      if  @input_num_of_ppl.to_i <= @chosen_room_type.max_capacity

      @rooms = Room.where(room_type_id: @chosen_room_type.id)

      @avails = @rooms.where(status: '0')

      render 'result'

      else

        flash.notice = "No available room"

        render 'result'

      end

    else

      flash.notice = "Invalid input"

    end

  end

  def result
    
  end

end
