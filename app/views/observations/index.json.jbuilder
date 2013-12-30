json.array!(@observations) do |observation|
  json.extract! observation, :project_id, :entity_id
  json.url observation_url(observation, format: :json)
end