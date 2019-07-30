# frozen_string_literal: true

# road trip poro class
class RoadTrip
  attr_reader :predicted,
              :id

  def initialize(start, ending)
    @start = start
    @ending = ending
  end

  def predicted
    forecast = Forecast.new(@ending)
    hourly_data = forecast.hourly
    geocode = GoogleGeocodeService.new
    time = geocode.get_time(@start, @ending)
    arrival_time = (time / 3600.0).round
    # binding.pry
    {"temperature" => hourly_data[arrival_time]["temperature"],
    "summary" => hourly_data[arrival_time]["summary"],
    "travel_time" => arrival_time}
  end

end
