# frozen string literal: true

module Api
  module V1
    # forecast controller
    class ForecastController < ApplicationController

      def index
        render json: ForecastSerializer.new(params[:location]).weather_data
      end

    end
  end
end
