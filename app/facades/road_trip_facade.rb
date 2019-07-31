# frozen_string_literal: true

# facade for road trip
class RoadTripFacade
  def initialize(start, ending)
    @start = start
    @ending = ending
  end

  def predicted_forecast
    hourly_data = forecast_object.hourly
    time = geocode_service.get_time(@start, @ending)
    arrival_time = (time / 3600.0).round
    { "temperature" => hourly_data[arrival_time]["temperature"],
      "summary" => hourly_data[arrival_time]["summary"],
      "travel_time" => arrival_time }
  end

  private

  def forecast_object
    Forecast.new(@ending)
  end

  def geocode_service
    GoogleGeocodeService.new
  end
end
