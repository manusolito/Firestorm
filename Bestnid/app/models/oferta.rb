class Oferta < ActiveRecord::Base
	belongs_to :usuario
	belongs_to :producto
	validate :ya_oferto?
	validate :dueno?
	def ya_oferto?
	  if Oferta.exists?(:usuario_id => self.usuario_id, :producto_id => self.producto_id) then
	     errors.add(:usuario, "ya oferto este producto.")
	  end
	end
	def dueno?
	  if self.producto.usuario_id == self.usuario_id then
	     errors.add(:usuario, "no puede ofertar sus productos.")
	  end
	end
end
