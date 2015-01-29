json.array!(@products) do |product|
  json.extract! product, :id, :name, :desc, :img_url, :price
  json.url product_url(product, format: :json)
end
