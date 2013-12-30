json.array!(@contexts) do |context|
  json.extract! context, :project_id, :observation_id, :has_context_id
  json.url context_url(context, format: :json)
end