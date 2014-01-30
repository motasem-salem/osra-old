class Orphan
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :father_name, type: String
  field :father_is_martyr, type: Boolean
  field :father_occupation, type: String
  field :father_place_of_death, type: String
  field :father_cause_of_death, type: String
  field :father_date_of_death, type: Date
  field :mother_name, type: String
  field :mother_alive, type: Boolean
  field :gender, type: String
  field :health_status, type: String
  field :schooling_status, type: String
  field :goes_to_school, type: Boolean
  field :guardian_name, type: String
  field :guardian_relationship, type: String
  field :guardian_id, type: String
  field :original_address_gov, type: String
  field :original_address_city, type: String
  field :original_address_neighborhood, type: String
  field :original_address_street, type: String
  field :original_address_details, type: String
  field :current_address_gov, type: String
  field :current_address_city, type: String
  field :current_address_neighborhood, type: String
  field :current_address_street, type: String
  field :current_address_details, type: String
  field :contact_number, type: String
  field :alt_contact_number, type: String
  field :sponsored_by_another_org, type: String
  field :another_org_sponsorship_details, type: String
  field :minor_siblings_count, type: String
  field :comments, type: String
end
