# frozen_string_literal: true

module Api
  module V1
    class PaymentsController < ApplicationController
      def show
        Payment.find(params[:id])
      end

      def index
        payments = Payment.where(bill_id: params[:bill_id])
        render json: payments, status: :ok
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

        rents = []

        irregular_users.each do |user|
          rents << create_rent_for_user(user, user.max_pay)
        end

        rest_users.each do |user|
          rents << create_rent_for_user(user, amount)
        end

        render json: rents, status: :ok
      end

      private

      def create_rent_for_user(user, amount)
        user.payments.create!(amount: amount,
                              place: place,
                              created_at: date,
                              status: status(user))
      end

      def place
        Place.find(rent_params[:place_id])
      end

      def date
        month, year = rent_params[:month].split(' ')
        Time.parse("01-#{month}-#{year}").in_time_zone
      end

      def status(user)
        place.payer == user ? 'paid' : 'wait'
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
