json.array!(@oferta) do |ofertum|
  json.extract! ofertum, :id, :motivo, :monto
  json.url ofertum_url(ofertum, format: :json)
end
