# frozen_string_literal: true

module Api
  module V1
    # sessions controller class
    class SessionsController < ApplicationController
      skip_before_action :verify_authenticity_token, raise: false

      def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          render json: UserSerializer.new(User.find_by(email: params[:email])), status: 200
        else
          render file: '/public/404'
        end
      end

    end
  end
end
