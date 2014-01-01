json.array!(@points) do |point|
  json.extract! point, :row_id, :measurement_id, :value
  json.url point_url(point, format: :json)
end