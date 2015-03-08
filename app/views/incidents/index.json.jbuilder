json.array!(@incidents) do |incident|
  json.extract! incident, :id, :tipo, :address, :fecha, :latitude, :longitude
  json.url incident_url(incident, format: :json)
end
