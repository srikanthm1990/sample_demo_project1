json.array!(@resources) do |resource|
  json.extract! resource, :id, :name, :cus_id
  json.url resource_url(resource, format: :json)
end
