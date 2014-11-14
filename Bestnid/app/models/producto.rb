class Producto < ActiveRecord::Base
    validates:nombre,presence:true, uniqueness:{case_sensitive:false, message:"Ya existe un producto con este nombre."}
	belongs_to :usuario
	has_many :ofertas
end
