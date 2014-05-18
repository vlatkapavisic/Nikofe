json.array!(@navbar_items) do |navbar_item|
  json.extract! navbar_item, :id, :name
  json.url navbar_item_url(navbar_item, format: :json)
end
