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

  def find_diner(location)
    conn = Faraday.new("https://api.yelp.com") do |f|
      f.headers['Authorization'] = "Bearer #{ENV['YELP_KEY']}"
      f.adapter Faraday.default_adapter
    end
    response = conn.get("/v3/businesses/search")
  end

end
