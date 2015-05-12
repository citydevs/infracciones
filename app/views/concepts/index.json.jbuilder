json.array!(@concepts) do |concept|
  json.extract! concept, :id, :infraccion, :monto, :corralon, :articulo, :fraccion, :parrafo, :inciso, :puntos
  json.url concept_url(concept, format: :json)
end
