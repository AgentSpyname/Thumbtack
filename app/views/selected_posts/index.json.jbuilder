json.array!(@selected_posts) do |selected_post|
  json.extract! selected_post, :id, :post_id
  json.url selected_post_url(selected_post, format: :json)
end
