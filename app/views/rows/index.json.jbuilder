json.array!(@rows) do |row|
  json.extract! row, :project_id
  json.url row_url(row, format: :json)
end