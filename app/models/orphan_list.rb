class OrphanList
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  include Mongoid::AutoInc

  field :status, default: Settings.orphan_list.statuses[0]
  auto_increment :osra_id

  mount_uploader :uploaded_list, OrphanListUploader

  embedded_in :partner, :inverse_of => :orphan_lists

  has_many :orphans

  def to_param
    osra_id.to_s
  end

end