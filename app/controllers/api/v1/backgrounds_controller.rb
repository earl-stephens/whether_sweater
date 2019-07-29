#frozen_string_literal: true

module Api
  module V1
# background controller class
    class BackgroundsController < ApplicationController

      def index
        render json: BackgroundSerializer.new(Background.new(params[:location]))
      end
    end
  end
end
