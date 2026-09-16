module Api
  module V1
    class RayonsController < BaseController
      def index
        rayons = Rayon.all
        render json: rayons, status: :ok
      end

      def show
        rayon = Rayon.find(params[:id])
        render json: rayon.as_json(include: :siswas), status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Rayon not found' }, status: :not_found
      end
    end
  end
end
