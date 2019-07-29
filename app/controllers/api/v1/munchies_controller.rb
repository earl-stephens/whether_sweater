module Api
  module V1
    class MunchiesController < ApplicationController

      def index
        # binding.pry
        render json: MunchiesSerializer.new(Munchies.new(request_params))
      end

    end
  end

  private

  
end

# params start end food
