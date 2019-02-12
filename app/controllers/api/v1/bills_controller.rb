module Api
  module V1
    class BillsController < ApplicationController
      def create
        bill = Bill.new(bill_params)
        byebug
        if bill.save
          render json: bill, status: :ok
        else
          render json: { errors: bill.errors }, status: :unprocessable_entity
        end
      end

      private

      def create_payments(bill)
        amount = (bill.amount / bill.users.size).ceil
        bill.users.each do |user|
          user.create_payment(amount: amount, status: status(user))
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
