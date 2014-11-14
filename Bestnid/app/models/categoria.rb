class Categoria < ActiveRecord::Base
    validates:nombre,presence:true, uniqueness:{case_sensitive:false, message:"Ya existe una categoria con este nombre."}
	has_many :productos, dependent: :destroy
end
