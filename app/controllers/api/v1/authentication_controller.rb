module Api
  module V1
    class AuthenticationController < ApplicationController
      skip_before_action :authenticate_request

      def token
        cmd = AuthenticateUser.call(credentials['identification'], credentials['password'])

        if cmd.success?
          render json: { token: cmd.result }
        else
          render json: { error: cmd.errors }, status: :unauthorized
        end
      end

      private

      def credentials
        params.permit(:identification, :password)
      end
    end
  end
end
