json.array!(@cops) do |infraction|
  json.extract! infraction, :id, :nombre, :placa, :raking_honestidad, :raking_trato
  json.url infraction_url(infraction, format: :json)
end
