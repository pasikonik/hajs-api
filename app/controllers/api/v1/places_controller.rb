# frozen_string_literal: true

module Api
  module V1
    class PlacesController < ApplicationController
      def index
        render json: Place.all, include: params[:include]
      end

      def show
        render json: Place.find(params[:id]), include: '**'
      end

      def create
        place = Place.new(place_params)
        if place.save
          add_payer(place)
          render json: place, status: :ok
        else
          render json: { errors: place.errors }, status: :unprocessable_entity
        end
      end

      private

      def add_payer(place)
        current_user.update!(payer: true)
        place.users << current_user
        place.save
      end

      def place_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:name, :rent])
      end
    end
  end
end
