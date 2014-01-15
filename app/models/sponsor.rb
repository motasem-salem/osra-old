class Sponsor
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  belongs_to :orgnization

  field :name, type: String
  field :status, type: String
  field :type, type: String
  field :gender, type: String
  field :address, type: String
  field :country, type: String
  field :partnership_start_date, type: Date
  field :email, type: String
  field :contact_1, type: String
  field :contact_2, type: String
  field :additional_info, type: String
  field :osra_id, type: Integer
end
