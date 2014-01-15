json.array!(@partners) do |partner|
  json.extract! partner, :id, :name, :governante, :region, :partnership_start_date, :status, :osra_id
  json.url partner_url(partner, format: :json)
end
