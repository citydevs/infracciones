json.array!(@concepts) do |concept|
  json.extract! concept, :id, :infraccion, :monto, :corralon
  json.url concept_url(concept, format: :json)
end
