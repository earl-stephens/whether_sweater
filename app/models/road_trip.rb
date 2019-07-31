# frozen_string_literal: true

# road trip poro class
class RoadTrip
  attr_reader :id

  def initialize(start, ending)
    @id = ending
    @start = start
    @ending = ending
  end

  def predicted
    road_trip_facade.predicted_forecast
  end

  private

  def road_trip_facade
    RoadTripFacade.new(@start, @ending)
  end
end
