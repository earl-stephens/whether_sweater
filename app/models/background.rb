# frozen_string_literal: true

# background model
class Background
  attr_reader :location,
              :image_url,
              :id

  def initialize(location)
    @location = location
    @image_url = grab_image_url
    @id = location
  end

  def grab_image_url
    service_data[:hits][0][:largeImageURL]
  end

  private

  def service
    @_service ||= PixabayService.new
  end

  def service_data
    @_service_data ||= service.city_image(@location)
  end

end
