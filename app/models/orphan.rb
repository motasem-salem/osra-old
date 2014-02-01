class Orphan
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :father_name
  field :father_is_martyr, type: Boolean
  field :father_occupation
  field :father_place_of_death
  field :father_cause_of_death
  field :father_date_of_death, type: Date
  field :mother_name
  field :mother_alive, type: Boolean
  field :gender
  field :health_status
  field :schooling_status
  field :goes_to_school, type: Boolean
  field :guardian_name
  field :guardian_relationship
  field :guardian_id
  field :original_address_gov
  field :original_address_city
  field :original_address_neighborhood
  field :original_address_street
  field :original_address_details
  field :current_address_gov
  field :current_address_city
  field :current_address_neighborhood
  field :current_address_street
  field :current_address_details
  field :contact_number
  field :alt_contact_number
  field :sponsored_by_another_org
  field :another_org_sponsorship_details
  field :minor_siblings_count, type: Integer
  field :sponsored_minor_siblings_count, type: Integer
  field :comments
end
