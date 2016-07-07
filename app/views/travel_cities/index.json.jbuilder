json.array!(@travel_cities) do |travel_city|
  json.extract! travel_city, :id, :from_city, :to_city, :started_on, :reache_on, :how_id, :trip_id
  json.url travel_city_url(travel_city, format: :json)
end
