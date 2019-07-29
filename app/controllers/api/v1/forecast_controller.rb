# frozen string literal: true

module Api
  module V1
    # forecast controller
    class ForecastController < ApplicationController

      def index
        render json: ForecastSerializer.new(Forecast.new(params[:location]))
      end

    end
  end
end
