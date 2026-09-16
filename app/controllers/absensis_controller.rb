class AbsensisController < ApplicationController
  before_action :set_absensi, only: [:show, :edit, :update, :destroy]

  def index
    @tanggal = params[:tanggal].present? ? Date.parse(params[:tanggal]) : Date.today
    @rombel_id = params[:rombel_id]

    @absensis = Absensi.includes(siswa: [:rombel, :rayon]).where(tanggal: @tanggal)
    if @rombel_id.present?
      @absensis = @absensis.joins(:siswa).where(siswas: { rombel_id: @rombel_id })
    end
    @absensis = @absensis.order('siswas.nama ASC')

    @rombels = Rombel.all
  end

  def new
    @tanggal = params[:tanggal].present? ? Date.parse(params[:tanggal]) : Date.today
    @rombel_id = params[:rombel_id]

    @rombels = Rombel.all
    if @rombel_id.present?
      @siswas = Siswa.where(rombel_id: @rombel_id, status: 'Aktif').order(:nama)
      existing_records = Absensi.where(tanggal: @tanggal, siswa_id: @siswas.pluck(:id)).index_by(&:siswa_id)
      @attendance_data = @siswas.map do |siswa|
        existing_records[siswa.id] || Absensi.new(siswa: siswa, tanggal: @tanggal, status_presensi: 'Hadir')
      end
    else
      @siswas = []
      @attendance_data = []
    end
  end

  def bulk_create
    tanggal = Date.parse(params[:tanggal])
    attendances_params = params[:attendances] || {}

    Absensi.transaction do
      attendances_params.each do |siswa_id, data|
        absensi = Absensi.find_or_initialize_by(siswa_id: siswa_id, tanggal: tanggal)
        absensi.status_presensi = data[:status_presensi]
        absensi.keterangan = data[:keterangan]
        absensi.save!
      end
    end

    redirect_to absensis_path(tanggal: tanggal, rombel_id: params[:rombel_id]), notice: 'Data Presensi berhasil disimpan.'
  rescue StandardError => e
    redirect_to new_absensi_path(tanggal: params[:tanggal], rombel_id: params[:rombel_id]), alert: "Gagal menyimpan presensi: #{e.message}"
  end

  def edit
  end

  def update
    if @absensi.update(absensi_params)
      redirect_to absensis_path(tanggal: @absensi.tanggal), notice: 'Presensi berhasil diperbarui.'
    else
      render :edit
    end
  end

  def destroy
    tgl = @absensi.tanggal
    @absensi.destroy
    redirect_to absensis_path(tanggal: tgl), notice: 'Catatan presensi dihapus.'
  end

  private

  def set_absensi
    @absensi = Absensi.find(params[:id])
  end

  def absensi_params
    params.require(:absensi).permit(:siswa_id, :tanggal, :status_presensi, :keterangan)
  end
end
