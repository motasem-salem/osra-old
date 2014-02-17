class OrphanSponsor
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :orphan
  belongs_to :sponsor

  field :status
end
