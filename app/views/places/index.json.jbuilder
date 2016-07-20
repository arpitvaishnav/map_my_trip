json.array!(@places) do |place|
  json.extract! place, :id, :place, :description
  json.url place_url(place, format: :json)
end
