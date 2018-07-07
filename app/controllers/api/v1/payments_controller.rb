module Api
  module V1
    class PaymentsController < ApplicationController
      def show
        Payment.find(params[:id])
      end

      def create_rent
        rent = place.rent
        amount = (rent / place.users.count).ceil

        place.users.each do |user|
          user.payments.create(amount: amount, created_at: date, status: 'wait')
        end
      end

      private

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
    end
  end
end
