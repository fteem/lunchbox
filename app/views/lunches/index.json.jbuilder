json.array!(@lunches) do |lunch|
  json.extract! lunch, :id, :name, :description, :state, :starts_on, :ends_on
  json.url lunch_url(lunch, format: :json)
end
