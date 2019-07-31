# frozen_string_literal: true

# facade for backgrounds
class BackgroundFacade
  def initialize(location)
    @location = location
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
