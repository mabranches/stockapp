json.array!(@stocks) do |stock|
  json.extract! stock, :id, :item_id, :warehouse_id
  json.url stock_url(stock, format: :json)
end
