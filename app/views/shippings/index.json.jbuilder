json.array!(@shippings) do |shipping|
  json.extract! shipping, :id, :name, :adr_1, :adr_2, :state, :zip, :total
  json.url shipping_url(shipping, format: :json)
end
