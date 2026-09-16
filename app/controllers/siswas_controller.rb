class SiswasController < ApplicationController
  before_action :set_siswa, only: [:show, :edit, :update, :destroy]

  # GET /siswas
  # GET /siswas.json
  def index
    @siswas = Siswa.includes(:rayon, rombel: :jurusan).order(:nama)
    export_fields = %w[nisn nis nama jk rombel_id rayon_id tempat_lahir tanggal_lahir alamat telepon nama_ortu telepon_ortu status]

    respond_to do |format|
      format.html
      format.csv { send_data @siswas.to_csv(export_fields), filename: "siswas-#{Date.today}.csv", type: "text/csv" }
      format.xls { send_data @siswas.to_csv(export_fields, col_sep: "\t"), filename: "siswas-#{Date.today}.xls", type: "application/vnd.ms-excel" }
    end
  end

  def import
    if params[:file].present?
      Siswa.import(params[:file])
      redirect_to siswas_url, notice: "Data Siswa berhasil di-import."
    else
      redirect_to siswas_url, alert: "Silakan pilih file CSV/Excel untuk di-import."
    end
  rescue StandardError => e
    redirect_to siswas_url, alert: "Gagal meng-import file: #{e.message}"
  end

  # GET /siswas/1
  # GET /siswas/1.json
  def show
    @absensis = @siswa.absensis.order(tanggal: :desc).limit(30)
  end

  # GET /siswas/new
  def new
    @siswa = Siswa.new
  end

  # GET /siswas/1/edit
  def edit
  end

  # POST /siswas
  # POST /siswas.json
  def create
    @siswa = Siswa.new(siswa_params)

    respond_to do |format|
      if @siswa.save
        format.html { redirect_to @siswa, notice: 'Data Siswa berhasil ditambahkan.' }
        format.json { render :show, status: :created, location: @siswa }
      else
        format.html { render :new }
        format.json { render json: @siswa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /siswas/1
  # PATCH/PUT /siswas/1.json
  def update
    respond_to do |format|
      if @siswa.update(siswa_params)
        format.html { redirect_to @siswa, notice: 'Data Siswa berhasil diperbarui.' }
        format.json { render :show, status: :ok, location: @siswa }
      else
        format.html { render :edit }
        format.json { render json: @siswa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /siswas/1
  # DELETE /siswas/1.json
  def destroy
    @siswa.destroy
    respond_to do |format|
      format.html { redirect_to siswas_url, notice: 'Data Siswa berhasil dihapus.' }
      format.json { head :no_content }
    end
  end

  private
    def set_siswa
      @siswa = Siswa.find(params[:id])
    end

    def siswa_params
      params.require(:siswa).permit(
        :nisn, :nis, :nama, :jk, :rombel_id, :rayon_id,
        :tempat_lahir, :tanggal_lahir, :alamat, :telepon,
        :nama_ortu, :telepon_ortu, :status
      )
    end
end