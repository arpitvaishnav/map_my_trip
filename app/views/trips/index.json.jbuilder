json.array!(@trips) do |trip|
  json.extract! trip, :id, :name, :description, :from_date, :to_date
  json.url trip_url(trip, format: :json)
end
