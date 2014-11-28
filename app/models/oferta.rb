class Oferta < ActiveRecord::Base
	belongs_to :usuario
	belongs_to :producto
end
