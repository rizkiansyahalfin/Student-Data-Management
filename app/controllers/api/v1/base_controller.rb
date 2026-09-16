module Api
  module V1
    class BaseController < ActionController::API
      before_action :authenticate_jwt_request!

      SECRET_KEY = Rails.application.secret_key_base || 'student_data_secret_key_2026'

      def self.encode_token(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
      end

      def self.decode_token(token)
        body = JWT.decode(token, SECRET_KEY)[0]
        HashWithIndifferentAccess.new(body)
      rescue StandardError
        nil
      end

      private

      def authenticate_jwt_request!
        header = request.headers['Authorization']
        token = header.split(' ').last if header.present?
        decoded = self.class.decode_token(token) if token

        if decoded && (@current_user = User.find_by(id: decoded[:user_id]))
          @current_user
        else
          render json: { error: 'Unauthorized or invalid token' }, status: :unauthorized
        end
      end

      attr_reader :current_user
    end
  end
end
