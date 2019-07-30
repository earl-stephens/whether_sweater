# frozen_string_literal: true

# pixabay service class
class PixabayService
  def conn
    Faraday.new('https://pixabay.com') do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def city_image(location)
    city = edited_location(location)
    response = conn.get("/api/?key=#{ENV['PIXABAY_KEY']}&q=#{city}&tags=city")
    JSON.parse(response.body, symbolize_names: true)
  end

  def edited_location(location)
    remove_state = location.split(',')
    remove_state[0].gsub(' ', '+')
  end
end
