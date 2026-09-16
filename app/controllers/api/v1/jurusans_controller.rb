module Api
  module V1
    class JurusansController < BaseController
      def index
        jurusans = Jurusan.all
        render json: jurusans, status: :ok
      end

      def show
        jurusan = Jurusan.find(params[:id])
        render json: jurusan.as_json(include: :rombels), status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Jurusan not found' }, status: :not_found
      end
    end
  end
end
