module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_request

      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :ok
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:email, :username, :password])
      end
    end
  end
end
