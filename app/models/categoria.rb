class Categoria < ActiveRecord::Base
    validates:nombre,presence:true
	validates_uniqueness_of :nombre, conditions: -> { where.not(disponible: 'false') }, message:"Ya existe una categoria con este nombre."
	has_many :productos, dependent: :destroy
end
