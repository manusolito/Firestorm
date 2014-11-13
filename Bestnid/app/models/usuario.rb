class Usuario < ActiveRecord::Base
	has_many :productos
  	has_many :ofertas
end
