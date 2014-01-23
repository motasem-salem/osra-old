class OrphansController < ApplicationController
  before_action :set_orphan, only: [:show, :edit, :update, :destroy]

  # GET /orphans
  # GET /orphans.json
  def index
    @orphans = Orphan.all
  end

  # GET /orphans/1
  # GET /orphans/1.json
  def show
  end

  # GET /orphans/new
  def new
    @orphan = Orphan.new
  end

  # GET /orphans/1/edit
  def edit
  end

  # POST /orphans
  # POST /orphans.json
  def create
    @orphan = Orphan.new(orphan_params)

    respond_to do |format|
      if @orphan.save
        format.html { redirect_to @orphan, notice: 'Orphan was successfully created.' }
        format.json { render action: 'show', status: :created, location: @orphan }
      else
        format.html { render action: 'new' }
        format.json { render json: @orphan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orphans/1
  # PATCH/PUT /orphans/1.json
  def update
    respond_to do |format|
      if @orphan.update(orphan_params)
        format.html { redirect_to @orphan, notice: 'Orphan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @orphan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orphans/1
  # DELETE /orphans/1.json
  def destroy
    @orphan.destroy
    respond_to do |format|
      format.html { redirect_to orphans_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orphan
      @orphan = Orphan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orphan_params
      params.require(:orphan).permit(:name, :father_name, :father_is_martyr, :father_occupation, :father_place_of_death, :father_cause_of_death, :father_date_of_death, :mother_name, :mother_alive, :gender, :health_status, :schooling_status, :goes_to_school, :guardian_name, :guardian_relationship, :guardian_id, :original_address_gov, :original_address_city, :original_address_neighborhood, :original_address_street, :original_address_details, :current_address_gov, :current_address_city, :current_address_neighborhood, :current_address_street, :current_address_details, :contact_number, :alt_contact_number, :sponsored_by_another_org, :another_org_sponsorship_details, :minor_siblings_count, :comments)
    end
end
