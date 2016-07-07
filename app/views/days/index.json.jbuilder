json.array!(@days) do |day|
  json.extract! day, :id, :name, :travel_city_id
  json.url day_url(day, format: :json)
end
