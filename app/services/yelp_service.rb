class YelpService

  def initialize(start, ending, food)
    @start = start
    @ending = ending
    @food = food
  end

  def get_time(start, ending)
    geocode = GoogleGeocodeService.new
    future_time = geocode.get_time(start, ending)
    predicted_time = Time.now.to_i + future_time
  end

  def diner_data
    timer = get_time(@start, @ending)
    # binding.pry
    conn = Faraday.new("https://api.yelp.com") do |f|
      f.headers['Authorization'] = "Bearer #{ENV['YELP_KEY']}"
      f.adapter Faraday.default_adapter
    end
    response = conn.get("/v3/businesses/search?term=#{@food}&latitude=#{grab_lat}&longitude=#{grab_long}&open_at=#{timer}")
    results = JSON.parse(response.body, symbolize_names: true)
    
  end



  def grab_lat
    # binding.pry
    service_coords[:results][0][:geometry][:location][:lat]
  end

  def grab_long
    service_coords[:results][0][:geometry][:location][:lng]
  end

  private

  def service
    @_service ||= GoogleGeocodeService.new
  end

  def service_coords
    @_service_coords ||= service.find_coords(@ending)
  end

end
