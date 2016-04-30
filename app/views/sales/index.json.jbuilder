json.array!(@sales) do |sale|
  json.extract! sale, :id, :customer_id, :unit, :price
  json.url sale_url(sale, format: :json)
end
