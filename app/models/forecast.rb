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
    {
      "time" => service_data[:currently][:time],
      "summary" => service_data[:currently][:summary],
      "icon" => service_data[:currently][:icon],
      "temperature" => service_data[:currently][:temperature],
      "feels_like" => service_data[:currently][:apparentTemperature],
      "humidity" => service_data[:currently][:humidity],
      "uv_index" => service_data[:currently][:uvIndex],
      "visibility" => service_data[:currently][:visibility],
      "hi_temp" => service_data[:daily][:temperatureHigh],
      "lo_temp" => service_data[:currently][:temperatureLow]
    }
  end

  def hourly
    {
      "time" => service_data[:hourly][:time],
      "summary" => service_data[:hourly][:summary],
      "icon" => service_data[:hourly][:icon],
      "temperature" => service_data[:hourly][:temperature]
    }
  end

  def daily
    {
      "icon" => service_data[:daily][:icon],
      "percent_precip" => service_data[:daily][:precipProbability],
      "precip_type" => service_data[:daily][:precipType],
      "hi_temp" => service_data[:daily][:temperatureHigh],
      "lo_temp" => service_data[:daily][:temperatureLow],
      "time" => service_data[:daily][:time]
    }
  end

  private

  def service
    @_service ||= DarkSkyService.new(@location)
  end

  def service_data
    @_service_data ||= service.weather_data
  end

end
