class YelpService

  def initialize
  end

  def diner_data(start, ending, food)
    binding.pry
    get_time(start, ending)
  end

  def get_time(start, ending)
    geocode = GoogleGeocodeService.new
    geocode.get_time(start, ending)
  end

end
