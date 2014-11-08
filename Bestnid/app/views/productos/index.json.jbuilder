json.array!(@productos) do |producto|
  json.extract! producto, :id, :nombre, :descripcion, :vencimiento
  json.url producto_url(producto, format: :json)
end
