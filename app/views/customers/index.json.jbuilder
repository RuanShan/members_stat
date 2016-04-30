json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :id_num, :cellphone
  json.url customer_url(customer, format: :json)
end
