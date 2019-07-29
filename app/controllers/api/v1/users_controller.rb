# frozen_string_literal: true

module Api
  module V1
    # users class
    class UsersController < ApplicationController

      def create
        user = User.new(user_params)
        if user.save
          render json: UserSerializer.new(User.find_by(email: user_params[:email])), status: 201
        end
      end

      private

      def user_params
        params.permit(:email, :password, :password_confirmation)
      end

    end
  end
end
