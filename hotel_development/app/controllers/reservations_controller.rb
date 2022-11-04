class ReservationsController < ApplicationController

  before_action :check

  def check

    if logged_in? && current_user.user_type == '0'
      #raise ActionController::RoutingError, 'Not Found'
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

    @reservation = Reservation.new(reservation_params)

    @room = Room.find_by_id(params[:reservation][:room_id])

    @capacity = @room.room_type.max_capacity

    @input_capacity = params[:reservation][:num_of_ppl]

    @is_reservation_create = ReservationService.createReservation(@reservation)

   if params[:reservation][:check_out] < params[:reservation][:check_in]

    flash.notice = "Please choose valid date"

    render 'new'

    elsif @input_capacity.to_i > @capacity.to_i

      flash.notice = "Insufficient space"

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

  def index

    @reservations = Reservation.all
    
  end

  def destroy

    @reservation = Reservation.find_by_id(params[:id])

    @room = Room.find_by_id(@reservation.room_id)

    @room.status = '0'

    @room.reservation_id = nil

    @room.save

    @reservation.destroy
    
  end

  def myReservations

    @myReservations = Reservation.where(user_id: current_user.id)
  
  end
  
  private 

  def reservation_params

    params[:reservation][:user_id] = current_user.id

    params.require(:reservation).permit(:check_in, :check_out, :num_of_ppl, :user_id , :room_id)
  
  end
end
