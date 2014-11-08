class Ofertum < ActiveRecord::Base
	belongs_to :usuario
	belongs_to :producto
end
