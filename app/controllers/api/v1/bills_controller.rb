# frozen_string_literal: true

module Api
  module V1
    class BillsController < ApplicationController
      def create
        bill = Bill.new(bill_params)
        if bill.save
          create_payments(bill)
          render json: bill, include: [:payments], status: :ok
        else
          render json: { errors: bill.errors }, status: :unprocessable_entity
        end
      end

      private

      def create_payments(bill)
        amount = (bill.amount / bill.users.size).ceil
        bill.users.each do |user|
          user.payments.create!(amount: amount,
                                status: status(user),
                                bill: bill,
                                place: bill.place)
        end
      end

      def status(user)
        user.place.payer == user ? 'paid' : 'wait'
      end

      def bill_params
        ActiveModelSerializers::Deserialization.jsonapi_parse!(
          params,
          only: %i[name amount place]
        )
      end
    end
  end
end
