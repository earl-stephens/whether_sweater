require "rails_helper"

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
  end

  # describe 'instance methods' do
  #   it '.create_api_key'do
  #     user = User.new(email: 'john@doe.com',
  #                     password: 'password')
  #
  #     expect(user.api_key).to eq(nil)
  #
  #     user.save
  #     user.reload
  #     binding.pry
  #     expect(user.api_key).to_not eq(nil)
  #   end
  # end
end
