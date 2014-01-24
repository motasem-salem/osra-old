class OrphanListsController < ApplicationController
  before_action :set_partner, only: [:create, :destroy]
  def create
    result = OrphanList.validate(params[:orphan_list][:uploaded_list])
    if result[:orphans]
      partner.orphan_lists.create!(params[:orphan_list])
      redirect_to @partner, :notice => "List added!"
    else
      params[:validation_errors] = result[:errors]
      render show_errors_path, :notice => "List NOT added!"
    end
  end

  def destroy
    @orphan_list = @partner.orphan_lists.find(params[:id])
    @orphan_list.destroy
    respond_to do |format|
      format.html { redirect_to partner_url(@partner) }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_partner
    @partner = Partner.find(params[:partner_id])
  end
end
