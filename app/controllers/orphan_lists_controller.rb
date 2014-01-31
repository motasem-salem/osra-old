class OrphanListsController < ApplicationController
  before_action :set_partner, only: [:import, :create, :show, :destroy]

  def create
    v = OrphanListValidator.new
    v.file = params[:orphan_list][:uploaded_list]
    @valid = v.valid?
    if @valid
      @extracted_orphans = v.extracted_orphans
      @orphan_list = @partner.orphan_lists.create!(params[:orphan_list])
    else
      @validation_errors = v.validation_errors
    end
  end

  def destroy
    @orphan_list = @partner.orphan_lists.find_by(osra_id: params[:id])
    @orphan_list.destroy
    respond_to do |format|
      format.html { redirect_to partner_url(@partner) }
      format.json { head :no_content }
    end
  end

  def show
    import
  end

  def import
    @orphan_list = @partner.orphan_lists.find_by(osra_id: params[:id])
    # get_orphans(@orphan_list)
    v = OrphanListValidator.new
    v.doc = Roo::Spreadsheet.open(@orphan_list.uploaded_list.file.file)
    v.valid?
    v.extracted_orphans.each(&:save!)
    @orphan_list.update(:status => Settings.orphan_list_statuses[3])

    redirect_to @partner, :notice => "List imported successfully. #{v.extracted_orphans.size} Orphans added."
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_partner
    @partner = Partner.find_by(osra_id: params[:partner_id])
  end
end
