json.array!(@measurements) do |measurement|
  json.extract! measurement, :observation_id, :trait_id, :value
  json.url measurement_url(measurement, format: :json)
end