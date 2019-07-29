# frozen_string_literal: true

# users model class
class User < ApplicationRecord

  validates_presence_of :email

  has_secure_password

end
