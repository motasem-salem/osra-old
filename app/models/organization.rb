class Organization
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  include Mongoid::AutoInc

  after_create :set_osra_id

  field :name
  field :country
  field :region
  field :partnership_start_date, type: Date
  field :status
  field :osra_id

  auto_increment :seq

  def set_osra_id
    update!(:osra_id => '%03d' % seq)
  end

  has_many :sponsors

  def to_param
    osra_id.to_s
  end
end
