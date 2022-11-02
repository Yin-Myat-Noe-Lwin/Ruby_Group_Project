class ReservationService

  class << self

    def getAllReservations

      @reservations = ReservationRepository.getAllReservations

    end

    def createReservation(reservation)

     @is_reservation_create = ReservationRepository.createReservation(reservation)

    end

    def getReservationByID(id)

      @reservation = ReservationRepository.getReservationByID(id)

    end

  end

end