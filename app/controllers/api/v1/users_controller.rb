# frozen_string_literal: true

module Api
  module V1
    # users class
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token, raise: false

      def create
        user = User.new(user_params)
        if user.save
          user.update(api_key: generate_api_key)
          render json: UserSerializer.new(
            User.find_by(email: user_params[:email])), status: 201
        else
          render json: { 'status': 'Not Found', 'status_code': 404 }
        end
      end

      private

      def user_params
        params.permit(:email, :password, :password_confirmation)
      end

      def generate_api_key
        SecureRandom.base64(28)
      end

    end
  end
end
