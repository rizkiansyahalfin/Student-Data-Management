module Api
  module V1
    class SiswasController < BaseController
      before_action :set_siswa, only: [:show, :update, :destroy]

      def index
        siswas = Siswa.includes(:rayon, rombel: :jurusan).order(:nama)
        render json: siswas.as_json(
          include: {
            rombel: { include: :jurusan },
            rayon: {}
          }
        ), status: :ok
      end

      def show
        render json: @siswa.as_json(
          include: {
            rombel: { include: :jurusan },
            rayon: {},
            absensis: { limit: 10 }
          }
        ), status: :ok
      end

      def create
        siswa = Siswa.new(siswa_params)
        if siswa.save
          render json: siswa, status: :created
        else
          render json: { errors: siswa.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @siswa.update(siswa_params)
          render json: @siswa, status: :ok
        else
          render json: { errors: @siswa.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @siswa.destroy
        head :no_content
      end

      private

      def set_siswa
        @siswa = Siswa.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Siswa not found' }, status: :not_found
      end

      def siswa_params
        params.require(:siswa).permit(
          :nisn, :nis, :nama, :jk, :rombel_id, :rayon_id,
          :tempat_lahir, :tanggal_lahir, :alamat, :telepon,
          :nama_ortu, :telepon_ortu, :status
        )
      end
    end
  end
end
