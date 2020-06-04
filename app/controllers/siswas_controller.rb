class SiswasController < ApplicationController
  before_action :set_siswa, only: [:show, :edit, :update, :destroy]

  # GET /siswas
  # GET /siswas.json
  def index
    @siswas = Siswa.order(:nama)
    respond_to do |format|
      format.html
      format.csv { send_data @siswas.to_csv(['nama', 'jk', 'rombel_id', 'rayon_id']).titleize }
      format.xls { send_data @siswas.to_csv(col_sep: "\t") }
    end
  end

  def import
    Siswa.import(params[:file])
    redirect_to root_url, notice: "Siswa Uploaded successfully"
  end

  # GET /siswas/1
  # GET /siswas/1.json
  def show
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
        format.html { redirect_to @siswa, notice: 'Siswa was successfully created.' }
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
        format.html { redirect_to @siswa, notice: 'Siswa was successfully updated.' }
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
      format.html { redirect_to siswas_url, notice: 'Siswa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_siswa
      @siswa = Siswa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def siswa_params
      params.require(:siswa).permit(:nama, :jk, :rombel_id, :rayon_id)
    end
end