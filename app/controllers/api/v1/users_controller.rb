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
        return unless check_password(user_params[:password])

        user_params.except!(:password)

        if user.update!(user_params)
          render json: user, status: :ok
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      private

      def user
        User.find(params[:id])
      end

      def check_password(password)
        user.authenticate(password) ? true : false
      end

      def user_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params) # TODO: refactor
      end
    end
  end
end
