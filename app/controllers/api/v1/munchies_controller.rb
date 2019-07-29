module Api
  module V1
    class MunchiesController < ApplicationController

      def index
        render json: MunchiesSerializer.new(Munchies.new(request_params))
      end

      private

      def request_params
        params.permit(:start, :end, :food)
      end
    end
  end

end

# params start end food
