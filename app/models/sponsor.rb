class Sponsor
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  belongs_to :organization

  field :name
  field :status
  field :type
  field :branch
  field :gender
  field :address
  field :country
  field :partnership_start_date, type: Date
  field :email
  field :contact_1
  field :contact_2
  field :additional_info
  field :osra_id, type: Integer

  validates_presence_of :branch
end
