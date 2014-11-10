class Producto < ActiveRecord::Base
	belongs_to :usuario
	has_many :ofertas
end
