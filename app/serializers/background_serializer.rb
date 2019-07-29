# frozen_string_literal: true

# background serializer class
class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image_url
end
