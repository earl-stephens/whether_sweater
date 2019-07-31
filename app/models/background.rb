# frozen_string_literal: true

# background model
class Background
  attr_reader :location,
              :image_url,
              :id

  def initialize(location)
    @location = location
    @image_url = image_url
    @id = location
  end

  def image_url
    background_facade.grab_image_url
  end

  private

  def background_facade
    BackgroundFacade.new(@location)
  end

end
