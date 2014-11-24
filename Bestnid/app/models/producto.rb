class Producto < ActiveRecord::Base
    validates:nombre,presence:true

	validate :fecha_invalida
	def fecha_invalida
	now = DateTime.now.to_date        
    fechaMenor = now + 15.days           
    fechaMayor = now + 30.days 
    	if  (vencimiento < fechaMenor)|(vencimiento > fechaMayor) 
      		errors.add(:vencimiento, "invalido. Ingrese una fecha entre 15 a 30 dias posterior a la fecha actual")
    	end
    end

	belongs_to :categoria
	belongs_to :usuario
	has_many :ofertas
end

