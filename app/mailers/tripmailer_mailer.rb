class TripmailerMailer < ApplicationMailer

  default from: "mail@example.com"

  def trip_send(trip)
    @trip = trip
    mail(to: "missstaceymay@gmail.com", subject: "Come Join my #{@trip.name}")
  end

end
