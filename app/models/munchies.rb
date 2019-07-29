class Munchies
  attr_reader :id,
              :restaurant_data

  def initialize(request_data)
    @id = request_data[:end]
    @start = request_data[:start]
    @end = request_data[:end]
    @food = request_data[:food]
    @restaurant_data = restaurant_data
  end

  def restaurant_data
    yelp_service = YelpService.new(@start, @end, @food)
    yelp_service.diner_data
  end

end
