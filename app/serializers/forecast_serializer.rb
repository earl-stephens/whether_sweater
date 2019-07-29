#frozen_string_literal: true

# forecast serializer class
class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current, :hourly, :daily
end
#   def initialize(location)
#     @location = location
#   end
#
#   def weather_data
#     forecast_poro_data = Forecast.new(@location)
#     data = {
#       "current": forecast_poro_data.current,
#       "hourly": forecast_poro_data.hourly,
#       "daily": forecast_poro_data.daily
#     }
#   end
# end
