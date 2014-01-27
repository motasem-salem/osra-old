class Partner
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  field :name, type: String
  field :governante, type: Integer
  field :region, type: String
  field :partnership_start_date, type: Date
  field :status, type: String

  auto_increment :osra_id

  validates_presence_of :name, :governante, :partnership_start_date, :status

  embeds_many :orphan_lists

  def to_param
    osra_id.to_s
  end

end
