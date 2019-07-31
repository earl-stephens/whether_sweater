# frozen_string_literal: true

# facade for forecasts
class ForecastFacade
  def initialize(location)
    @location = location
  end

  def current
    {
      "time" => service_data[:currently][:time],
      "summary" => service_data[:currently][:summary],
      "icon" => service_data[:currently][:icon],
      "temperature" => service_data[:currently][:temperature],
      "feels_like" => service_data[:currently][:apparentTemperature],
      "humidity" => service_data[:currently][:humidity],
      "uv_index" => service_data[:currently][:uvIndex],
      "visibility" => service_data[:currently][:visibility],
      "hi_temp" => service_data[:daily][:data][0][:temperatureHigh],
      "lo_temp" => service_data[:daily][:data][0][:temperatureLow]
    }
  end

  def hourly
    service_data[:hourly][:data].map do |datum|
      {
        "time" => datum[:time],
        "summary" => datum[:summary],
        "icon" => datum[:icon],
        "temperature" => datum[:temperature]
      }
    end
  end

  def daily
    service_data[:daily][:data].map do |datum|
      {
        "icon" => datum[:icon],
        "percent_precip" => datum[:precipProbability],
        "precip_type" => datum[:precipType],
        "hi_temp" => datum[:temperatureHigh],
        "lo_temp" => datum[:temperatureLow],
        "time" => datum[:time]
      }
    end
  end

  private

  def service
    @_service ||= DarkSkyService.new(@location)
  end

  def service_data
    @_service_data ||= service.weather_data
  end
end
