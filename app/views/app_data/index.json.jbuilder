json.array!(@app_data) do |app_datum|
  json.extract! app_datum, :id
  json.url app_datum_url(app_datum, format: :json)
end
