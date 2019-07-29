class YelpService

  def initialize(start, ending, food)
    @start = start
    @ending = ending
    @food = food
  end

  def get_time(start, ending)
    geocode = GoogleGeocodeService.new
    geocode.get_time(start, ending)
  end

  def diner_data
    # get_time(@start, @ending)
    conn = Faraday.new("https://api.yelp.com") do |f|
      f.headers['Authorization'] = "Bearer #{ENV['YELP_KEY']}"
      f.adapter Faraday.default_adapter
    end
    response = conn.get("/v3/businesses/search?term=#{@food}&latitude=#{grab_lat}&longitude=#{grab_long}")
    results = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

  def grab_lat
    service_coords["lat"].to_i
  end

  def grab_long
    service_coords["lng"].to_i
  end

  private

  def service
    @_service ||= GoogleGeocodeService.new
  end

  def service_coords
    @_service_coords ||= service.find_coords(@ending)
  end

end
