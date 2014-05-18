json.array!(@pages) do |page|
  json.extract! page, :id, :user_id, :title, :body, :navbar_item_id, :slug
  json.url page_url(page, format: :json)
end
