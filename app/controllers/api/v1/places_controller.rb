module Api
  module V1
    class PlacesController < ApplicationController
      def index
        render json: Place.all, include: params[:include]
      end

      def show
        render json: Place.find(params[:id])
      end
    end
  end
end
