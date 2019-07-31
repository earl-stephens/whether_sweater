# frozen_string_literal: true

# forecast model class
class Forecast
  attr_reader :id,
              :location,
              :current,
              :hourly,
              :daily

  def initialize(location)
    @id = location
    @location = location
    @current = current
    @hourly = hourly
    @daily = daily
  end

  def current
    forecast_facade.current
  end

  def hourly
    forecast_facade.hourly
  end

  def daily
    forecast_facade.daily
  end

  private

  def forecast_facade
    ForecastFacade.new(@location)
  end

end
