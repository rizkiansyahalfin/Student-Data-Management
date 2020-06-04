class RombelsController < ApplicationController
  before_action :set_rombel, only: [:show, :edit, :update, :destroy]

  # GET /rombels
  # GET /rombels.json
  def index
    @rombels = Rombel.all
  end

  # GET /rombels/1
  # GET /rombels/1.json
  def show
  end

  # GET /rombels/new
  def new
    @rombel = Rombel.new
  end

  # GET /rombels/1/edit
  def edit
  end

  # POST /rombels
  # POST /rombels.json
  def create
    @rombel = Rombel.new(rombel_params)

    respond_to do |format|
      if @rombel.save
        format.html { redirect_to @rombel, notice: 'Rombel was successfully created.' }
        format.json { render :show, status: :created, location: @rombel }
      else
        format.html { render :new }
        format.json { render json: @rombel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rombels/1
  # PATCH/PUT /rombels/1.json
  def update
    respond_to do |format|
      if @rombel.update(rombel_params)
        format.html { redirect_to @rombel, notice: 'Rombel was successfully updated.' }
        format.json { render :show, status: :ok, location: @rombel }
      else
        format.html { render :edit }
        format.json { render json: @rombel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rombels/1
  # DELETE /rombels/1.json
  def destroy
    @rombel.destroy
    respond_to do |format|
      format.html { redirect_to rombels_url, notice: 'Rombel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rombel
      @rombel = Rombel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rombel_params
      params.require(:rombel).permit(:jurusan_id, :rombel)
    end
end
