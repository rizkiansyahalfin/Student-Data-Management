class JurusansController < ApplicationController
  before_action :set_jurusan, only: [:show, :edit, :update, :destroy]

  # GET /jurusans
  # GET /jurusans.json
  def index
    @jurusans = Jurusan.all
  end

  # GET /jurusans/1
  # GET /jurusans/1.json
  def show
  end

  # GET /jurusans/new
  def new
    @jurusan = Jurusan.new
  end

  # GET /jurusans/1/edit
  def edit
  end

  # POST /jurusans
  # POST /jurusans.json
  def create
    @jurusan = Jurusan.new(jurusan_params)

    respond_to do |format|
      if @jurusan.save
        format.html { redirect_to @jurusan, notice: 'Jurusan was successfully created.' }
        format.json { render :show, status: :created, location: @jurusan }
      else
        format.html { render :new }
        format.json { render json: @jurusan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jurusans/1
  # PATCH/PUT /jurusans/1.json
  def update
    respond_to do |format|
      if @jurusan.update(jurusan_params)
        format.html { redirect_to @jurusan, notice: 'Jurusan was successfully updated.' }
        format.json { render :show, status: :ok, location: @jurusan }
      else
        format.html { render :edit }
        format.json { render json: @jurusan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jurusans/1
  # DELETE /jurusans/1.json
  def destroy
    @jurusan.destroy
    respond_to do |format|
      format.html { redirect_to jurusans_url, notice: 'Jurusan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jurusan
      @jurusan = Jurusan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jurusan_params
      params.require(:jurusan).permit(:jurusan)
    end
end
