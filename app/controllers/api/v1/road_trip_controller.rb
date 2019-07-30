# frozen_string_literal: true

module Api
  module V1
    # road trip controller class
    class RoadTripController < ApplicationController

      def index
        user = User.find_by(api_key: params[:api_key])
        if user
          render json: RoadTripSerializer.new(
            RoadTrip.new(params[:origin], params[:destination]))
        else
          render json: { "status": 'Unauthorized', "status_code": 401 }
        end
      end

    end
  end
end
