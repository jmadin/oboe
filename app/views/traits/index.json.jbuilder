json.array!(@traits) do |trait|
  json.extract! trait, :trait_name
  json.url trait_url(trait, format: :json)
end