module Api
  module V1
    class PaymentsController < ApplicationController
      def show
        Payment.find(params[:id])
      end

      def update
        payment = Payment.find(params[:id])
        if payment.update(payment_params)
          render json: payment, status: :ok
        else
          render json: { errors: payment.errors }, status: :unprocessable_entity
        end
      end

      # TODO: refactor
      def create_rent
        irregular_users = place.users.reject { |u| u.max_pay.nil? }
        rest_users = place.users - irregular_users

        irregular_amount = irregular_users.sum(&:max_pay)
        rest_amount = place.rent - irregular_amount
        amount = (rest_amount / rest_users.count).ceil

        irregular_users.each do |user|
          create_rent_for_user(user, user.max_pay)
        end

        rest_users.each do |user|
          create_rent_for_user(user, amount)
        end
      end

      private

      def create_rent_for_user(user, amount)
        user.payments.create(amount: amount,
                             place: place,
                             created_at: date,
                             status: 'wait')
      end

      def place
        Place.find(rent_params[:place_id])
      end

      def date
        month, year = rent_params[:month].split(' ')
        Time.parse("01-#{month}-#{year}")
      end

      def rent_params
        params.permit(:place_id, :month)
      end

      def payment_params
        ActiveModelSerializers::Deserialization.jsonapi_parse!(params, only: [:status])
      end
    end
  end
end
