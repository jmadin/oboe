json.array!(@standards) do |standard|
  json.extract! standard, :standard_name
  json.url standard_url(standard, format: :json)
end