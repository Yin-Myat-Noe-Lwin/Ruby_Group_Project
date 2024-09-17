class ReserveMailer < ApplicationMailer

  def reservation_confirmation(reservation)

    @reservation = reservation

    mail(:to => "#{reservation.user.name} <#{reservation.user.email}>", :subject => "Booking Successful")
  
  end

end