class ReservationRepository
  
  class << self
    
    def getAllReservations

      @reservations = Reservation.all

    end

    def createReservation(reservation)

      @is_reservation_create = reservation.save

    end

    def getReservaitionByID(id)

      @reservation = Reservation.find(id)

    end

  end

end