# frozen_string_literal: true

# road trip serializer class
class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :predicted
end
