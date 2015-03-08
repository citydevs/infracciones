json.array!(@cops) do |infraction|
  json.extract! infraction, :id, :nombre, :placa
  json.url cop_url(infraction, format: :json)
end
