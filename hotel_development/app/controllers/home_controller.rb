class HomeController < ApplicationController
  
  before_action :check

  def check

    if logged_in?

    if current_user.user_type == '0' 

      #raise ActionController::RoutingError, 'Not Found'

      render 'home/logout_Page'

    end

  end

  end

  def homePage

    @room_types = RoomTypeService.getAllRoomTypes

    @food_types = FoodTypeService.getAllFoodTypes

  end

  def search

    @input_check_in = params[:check_in]

    @input_check_out = params[:check_out]

    @input_num_of_ppl = params[:num_of_ppl]

    @input_room_type_id = params[:room_type_id]

    @chosen_room_type = RoomType.find_by_id(@input_room_type_id)
      
    if @input_check_in.blank? && @input_check_out.blank? && @input_num_of_ppl.blank? && @input_room_type_id.blank?

      flash.alert = "Data can't be blank"

      redirect_to(request.env['HTTP_REFERER'])

    elsif @input_num_of_ppl.present? &&  @input_room_type_id.present? &&  @input_num_of_ppl.to_i > @chosen_room_type.max_capacity

      flash.alert = "Insufficient space"

      redirect_to(request.env['HTTP_REFERER'])

    elsif  @input_check_in.present? && @input_check_in.to_datetime  < Date.today

      flash.alert = "You can't choose previous dates"

      redirect_to(request.env['HTTP_REFERER'])

    elsif @input_check_out.present? && @input_check_out.to_datetime  < Date.today

      flash.alert = "You can't choose the previous dates"

      redirect_to(request.env['HTTP_REFERER'])

    elsif @input_check_in.present? &&  @input_check_out.present? &&  @input_check_out < @input_check_in

      flash.alert = "Invalid checkin date "

      redirect_to(request.env['HTTP_REFERER'])

    elsif @input_check_in.present? &&  @input_check_out.present? &&  @input_check_out.to_datetime - @input_check_in.to_datetime >= 30

      flash.alert = "Sorry, you can't book a room for more than 30 days"

      redirect_to(request.env['HTTP_REFERER'])

    elsif @input_check_in.present? &&  @input_check_out.present? &&
          @input_num_of_ppl.present? &&  @input_room_type_id.present?
          #@input_check_in >= @input_check_out && 
          #@input_check_in.to_datetime >= Date.today &&
          #@input_check_out.to_datetime >= Date.today && 
          #@input_num_of_ppl.to_i <= @chosen_room_type.max_capacity

      @rooms = Room.where(room_type_id: @chosen_room_type.id)

      @avails = @rooms.where(status: '0')

      render 'result'

    else

      flash.alert = "Invalid data"

      redirect_to(request.env['HTTP_REFERER'])

    end

  end

  def result
    
  end

  def userProfile

    if !logged_in? 

      render 'sessions/loginForm'

    end

  end

end