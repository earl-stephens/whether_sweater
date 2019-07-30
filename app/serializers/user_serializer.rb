# frozen_string_literal: true

# serializer for users
class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :api_key
end
