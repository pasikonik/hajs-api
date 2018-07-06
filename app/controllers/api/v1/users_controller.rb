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

      def show
        render json: User.find(params[:id]), status: :ok
      end

      def update
        user = User.find(params[:id])
        password = user_params[:password]
        return unless check_password(user, password)
        user_params.except!(:password)

        if user.update!(user_params)
          render json: user, status: :ok
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      private

      def check_password(user, password)
        user.authenticate(password) ? true : false
      end

      def user_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params) # TODO: refactor
      end
    end
  end
end
