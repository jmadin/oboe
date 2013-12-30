json.array!(@ds) do |d|
  json.extract! d, :measurement_id, :value
  json.url d_url(d, format: :json)
end