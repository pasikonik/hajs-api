module Api
  module V1
    class PlacesController < ApplicationController
      def index
        render jsonapi: Place.all, include: params[:include]
      end
    end
  end
end
