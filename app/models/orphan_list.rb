require 'roo'

class OrphanList
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::AutoInc

  before_create :set_new_status

  field :status
  auto_increment :osra_id

  mount_uploader :uploaded_list, OrphanListUploader

  embedded_in :partner, :inverse_of => :orphan_lists

  def to_param
    osra_id.to_s
  end

  def set_new_status
    self.status = Settings.orphan_list_statuses[0]
  end



end