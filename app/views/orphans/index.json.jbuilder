json.array!(@orphans) do |orphan|
  json.extract! orphan, :id, :name, :father_name, :father_is_martyr, :father_occupation, :father_place_of_death, :father_cause_of_death, :father_date_of_death, :mother_name, :mother_alive, :gender, :health_status, :schooling_status, :goes_to_school, :guardian_name, :guardian_relationship, :guardian_id, :original_address_gov, :original_address_city, :original_address_neighborhood, :original_address_street, :original_address_details, :current_address_gov, :current_address_city, :current_address_neighborhood, :current_address_street, :current_address_details, :contact_number, :alt_contact_number, :sponsored_by_another_org, :another_org_sponsorship_details, :minor_siblings_count, :comments
  json.url orphan_url(orphan, format: :json)
end
