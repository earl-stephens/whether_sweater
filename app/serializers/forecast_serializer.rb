#frozen_string_literal: true

# forecast serializer class
class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current, :hourly, :daily
end
