json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :country, :region, :partnership_start_date, :status, :osra_id
  json.url organization_url(organization, format: :json)
end
