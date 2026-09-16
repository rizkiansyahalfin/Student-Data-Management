module Api
  module V1
    class AbsensisController < BaseController
      def index
        tanggal = params[:tanggal].present? ? Date.parse(params[:tanggal]) : Date.today
        absensis = Absensi.includes(siswa: :rombel).where(tanggal: tanggal)
        render json: absensis.as_json(include: { siswa: { only: [:id, :nama, :nisn] } }), status: :ok
      end

      def show
        absensi = Absensi.find(params[:id])
        render json: absensi.as_json(include: :siswa), status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Absensi not found' }, status: :not_found
      end

      def create
        absensi = Absensi.new(absensi_params)
        if absensi.save
          render json: absensi, status: :created
        else
          render json: { errors: absensi.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        absensi = Absensi.find(params[:id])
        if absensi.update(absensi_params)
          render json: absensi, status: :ok
        else
          render json: { errors: absensi.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def absensi_params
        params.require(:absensi).permit(:siswa_id, :tanggal, :status_presensi, :keterangan)
      end
    end
  end
end
