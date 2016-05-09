json.array!(@pages) do |page|
  json.extract! page, :id, :nested, :postable, :slug, :static
  json.url page_url(page, format: :json)
end
