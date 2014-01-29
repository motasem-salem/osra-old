class OrphanListsController < ApplicationController
  before_action :set_partner, only: [:import, :create, :show, :destroy]

  def create
    @validation_result = OrphanList.validate(params[:orphan_list][:uploaded_list])
    @valid = @validation_result[:errors].empty?
    if @valid
      @orphan_list = @partner.orphan_lists.create!(params[:orphan_list])
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
    imported_orphans = OrphanList.get_orphans(Roo::Spreadsheet.open(@orphan_list.uploaded_list.file.file))[:orphans]
    imported_orphans.each(&:save!)
    @orphan_list.update(:status => Settings.orphan_list_statuses[3])

    redirect_to @partner, :notice => "List imported successfully. #{imported_orphans.size} Orphans added."
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_partner
    @partner = Partner.find_by(osra_id: params[:partner_id])
  end
end
