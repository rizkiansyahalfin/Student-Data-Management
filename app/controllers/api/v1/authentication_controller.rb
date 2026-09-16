module Api
  module V1
    class AuthenticationController < BaseController
      skip_before_action :authenticate_jwt_request!, only: [:login]

      def login
        user = User.find_by(email: params[:email])
        if user&.valid_password?(params[:password])
          token = BaseController.encode_token(user_id: user.id)
          render json: {
            token: token,
            user: {
              id: user.id,
              email: user.email
            },
            message: 'Login successful'
          }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      def logout
        render json: { message: 'Logged out successfully' }, status: :ok
      end
    end
  end
end
