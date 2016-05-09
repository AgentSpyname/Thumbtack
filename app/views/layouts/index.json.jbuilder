json.array!(@layouts) do |layout|
  json.extract! layout, :id, :name, :custom_layout, :layout_type
  json.url layout_url(layout, format: :json)
end
