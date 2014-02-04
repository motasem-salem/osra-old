class Partner
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  include Mongoid::AutoInc

  after_create :set_osra_id

  field :name
  field :governorate, type: Integer
  field :region
  field :partnership_start_date, type: Date
  field :status
  field :osra_id

  auto_increment :seq, :scope => :governorate

  validates_presence_of :name, :governorate, :partnership_start_date, :status

  embeds_many :orphan_lists

  def set_osra_id
    update!(:osra_id => '%d%03d' % [governorate, seq])
  end

  def to_param
    osra_id.to_s
  end

end
