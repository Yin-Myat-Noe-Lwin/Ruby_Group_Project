class ReservationsController < ApplicationController

  before_action :check, :except => [:index, :destroy]

  def check

    if logged_in?

      if current_user.user_type == '0' 

        render 'admins/strict'

      end

    else 

      render 'sessions/loginForm'

    end

  end

  before_action :user_access, :except => [:new, :create, :myReservations, :destroy]

  def user_access

    if logged_in? && current_user.user_type == '1' 

      render 'admins/strict'

    end

  end

  def new

    if logged_in? && current_user.user_type == '1' 

    @reservation = Reservation.new

    @url_params = request.original_fullpath 

    else

      render 'sessions/loginForm'

    end

  end

  def create

    @reservation = Reservation.new(reservation_params)

    @room = Room.find_by_id(params[:reservation][:room_id])

    @capacity = @room.room_type.max_capacity

    @input_capacity = params[:reservation][:num_of_ppl]

    if params[:reservation][:check_in].blank? &&  params[:reservation][:check_out].blank? &&
       params[:reservation][:num_of_ppl].blank?

      flash.alert = "Data can't be blank"

      redirect_to(request.env['HTTP_REFERER'])

    elsif params[:reservation][:check_in].present? &&
          params[:reservation][:check_in ].to_datetime  < Date.today

          flash.alert = "You can't choose the previous dates"

          redirect_to(request.env['HTTP_REFERER'])

    elsif params[:reservation][:check_out].present? &&
          params[:reservation][:check_out ].to_datetime  < Date.today

          flash.alert = "You can't choose the previous dates"

          redirect_to(request.env['HTTP_REFERER'])

    elsif params[:reservation][:check_in].present? &&  params[:reservation][:check_out].present? &&
          params[:reservation][:check_out ] < params[:reservation][:check_in ]

      flash.alert = "Invalid checkin date"

      redirect_to(request.env['HTTP_REFERER'])

    elsif params[:reservation][:check_in].present? &&  params[:reservation][:check_out].present? &&
      params[:reservation][:check_out ].to_datetime - params[:reservation][:check_in ].to_datetime >= 30

        flash.alert = "Sorry, you can't book a room for more than 30 days."

        redirect_to(request.env['HTTP_REFERER'])

    elsif @input_capacity.to_i > @capacity.to_i
   
      flash.alert = "Insufficient spcae"

      redirect_to(request.env['HTTP_REFERER'])

    elsif params[:reservation][:check_in].present? &&  params[:reservation][:check_out].present? &&
      params[:reservation][:num_of_ppl].present? 
      #@input_capacity.to_i <= @capacity.to_i &&
      #params[:reservation][:check_in].to_datetime >= Date.today &&
      #params[:reservation][:check_out].to_datetime >= Date.today &&
      #params[:reservation][:check_in ] >= params[:reservation][:check_out ]

      @is_reservation_create = ReservationService.createReservation(@reservation)
      
          @new_url_params = request.original_fullpath 
      
            @room.status = '1'
      
            @room.reservation_id = @reservation.id
      
            @room.save
      
            redirect_to myReservations_path
      
            ReserveMailer.reservation_confirmation(@reservation).deliver

    else

      flash.alert = "Invalid data"

      redirect_to(request.env['HTTP_REFERER'])

    end

#    if params[:reservation][:check_out] < params[:reservation][:check_in]
#
#    flash.alert = "Please choose valid date"
#
#    redirect_to(request.env['HTTP_REFERER'])
#
#    elsif @input_capacity.to_i > @capacity.to_i
#
#    flash.alert = "Insufficient space"
#
#    redirect_to(request.env['HTTP_REFERER'])
#
#    elsif params[:reservation][:check_in].blank? && params[:reservation][:check_out].blank? && params[:reservation][:max_capacity].blank?
#
#    flash.alert =  "Data can't be blank"
#
#    redirect_to(request.env['HTTP_REFERER'])
#
#    elsif params[:reservation][:check_in].to_datetime  < Date.today 
#
#      flash.alert = "You can't choose previous dates"
#
#    redirect_to(request.env['HTTP_REFERER'])
#
#    elsif  params[:reservation][:check_out].to_datetime  < Date.today
#
#      flash.alert = "You can't choose previous dates"
#
#      redirect_to(request.env['HTTP_REFERER'])
#    
#    else
#
#    @is_reservation_create = ReservationService.createReservation(@reservation)
#
#    @new_url_params = request.original_fullpath 
#
#      @room.status = '1'
#
#      @room.reservation_id = @reservation.id
#
#      @room.save
#
#      flash.notice = "Booked successful"
#
#      redirect_to myReservations_path
#
#      ReserveMailer.reservation_confirmation(@reservation).deliver
#
#    end

  end

  def index

    @reservations = Reservation.all
    
  end

  def destroy

    if logged_in? && current_user.user_type == '1' 

    @reservation = Reservation.find_by_id(params[:id])

    @room = Room.find_by_id(@reservation.room_id)

    @room.status = '0'

    @room.reservation_id = nil

    @room.save

    @reservation.destroy

    redirect_to(request.env['HTTP_REFERER'])

   elsif logged_in? && current_user.user_type == '0' 

    @reservation = Reservation.find_by_id(params[:id])

    @room = Room.find_by_id(@reservation.room_id)

    @room.status = '0'

    @room.reservation_id = nil

    @room.save

    @reservation.destroy

    respond_to do |format|

      format.js{render :js => "window.location.href='"+reservations_path+"'"}  
      
    end

   else

    render 'sessions/loginForm'

   end

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