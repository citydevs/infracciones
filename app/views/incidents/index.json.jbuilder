json.array!(@incidents) do |incident|
  json.extract! incident, :id, :type, :address, :date, :latitude, :longitude
  json.url incident_url(incident, format: :json)
end
