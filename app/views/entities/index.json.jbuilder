json.array!(@entities) do |entity|
  json.extract! entity, :entity_name
  json.url entity_url(entity, format: :json)
end