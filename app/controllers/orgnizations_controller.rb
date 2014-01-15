class OrgnizationsController < ApplicationController
  before_action :set_orgnization, only: [:show, :edit, :update, :destroy]

  # GET /orgnizations
  # GET /orgnizations.json
  def index
    @orgnizations = Orgnization.all
  end

  # GET /orgnizations/1
  # GET /orgnizations/1.json
  def show
  end

  # GET /orgnizations/new
  def new
    @orgnization = Orgnization.new
  end

  # GET /orgnizations/1/edit
  def edit
  end

  # POST /orgnizations
  # POST /orgnizations.json
  def create
    @orgnization = Orgnization.new(orgnization_params)

    respond_to do |format|
      if @orgnization.save
        format.html { redirect_to @orgnization, notice: 'Orgnization was successfully created.' }
        format.json { render action: 'show', status: :created, location: @orgnization }
      else
        format.html { render action: 'new' }
        format.json { render json: @orgnization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orgnizations/1
  # PATCH/PUT /orgnizations/1.json
  def update
    respond_to do |format|
      if @orgnization.update(orgnization_params)
        format.html { redirect_to @orgnization, notice: 'Orgnization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @orgnization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orgnizations/1
  # DELETE /orgnizations/1.json
  def destroy
    @orgnization.destroy
    respond_to do |format|
      format.html { redirect_to orgnizations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orgnization
      @orgnization = Orgnization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orgnization_params
      params.require(:orgnization).permit(:name, :country, :region, :partnership_start_date, :status, :osra_id)
    end
end
