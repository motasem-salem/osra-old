class Partner
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  field :name, type: String
  field :governante, type: Integer
  field :region, type: String
  field :partnership_start_date, type: Date
  field :status, type: String
  field :osra_id, type: Integer
  field :_id, type: String, default: ->{ osra_id } 
  
  validates_presence_of :name, :osra_id, :partnership_start_date
  
# validates :partnership_start_date, presence: true 

  embeds_many :orphan_lists
end
