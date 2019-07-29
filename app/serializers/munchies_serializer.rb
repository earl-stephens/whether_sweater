class MunchiesSerializer
  include FastJsonapi::ObjectSerializer

  attributes :restaurant_data,
             :restaurant_hours,
             :restaurant_city
end
