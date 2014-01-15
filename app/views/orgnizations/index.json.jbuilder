json.array!(@orgnizations) do |orgnization|
  json.extract! orgnization, :id, :name, :country, :region, :partnership_start_date, :status, :osra_id
  json.url orgnization_url(orgnization, format: :json)
end
