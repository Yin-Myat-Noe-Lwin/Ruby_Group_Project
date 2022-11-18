class BookingsController < ApplicationController

  #  before_action :check
  #
  #  def check
  #
  #    if logged_in? && current_user.user_type == '0'
  #    
  #      render 'sessions/loginForm'
  #      
  #    end
  #
  #  end

  before_action :check

  def check

    if logged_in?

      if current_user.user_type == '0' 

        render 'admins/strict'

      end

    else 

      render 'sessions/loginForm'

    end

  end
    
    def new
  
      if logged_in?
  
      @reservation = Reservation.new
  
      else
  
        render 'sessions/loginForm'
  
      end
  
    end
  
    def create
  
      @reservation = Reservation.new(booking_params)
  
      @room = Room.find_by_id(params[:reservation][:room_id])
  
      @capacity = @room.room_type.max_capacity
  
      @input_capacity = params[:reservation][:num_of_ppl]
  
      @is_reservation_create = ReservationService.createReservation(@reservation)
  
     if params[:reservation][:check_out] < params[:reservation][:check_in]
  
      flash.alert = "Please choose valid date"
  
      render 'new'
  
      elsif @input_capacity.to_i > @capacity.to_i
  
        flash.alert = "Insufficient space"
  
        render 'new'
      
     elsif @is_reservation_create 
  
        @room.status = '1'
  
        @room.reservation_id = @reservation.id
  
        @room.save
  
        flash.notice="Booked successful"
  
        redirect_to root_path
        
      else
  
        render 'new'
  
      end
  
    end

    private 

  def booking_params

    params[:reservation][:user_id] = current_user.id

    params.require(:reservation).permit(:check_in, :check_out, :num_of_ppl, :user_id , :room_id)
  
  end
  
end
