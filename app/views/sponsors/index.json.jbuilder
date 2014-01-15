json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :name, :status, :type, :orgnization_id, :gender, :address, :country, :partnership_start_date, :email, :contact_1, :contact_2, :additional_info, :osra_id
  json.url sponsor_url(sponsor, format: :json)
end
