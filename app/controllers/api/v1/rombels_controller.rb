module Api
  module V1
    class RombelsController < BaseController
      def index
        rombels = Rombel.includes(:jurusan).all
        render json: rombels.as_json(include: :jurusan), status: :ok
      end

      def show
        rombel = Rombel.find(params[:id])
        render json: rombel.as_json(include: [:jurusan, :siswas]), status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Rombel not found' }, status: :not_found
      end
    end
  end
end
