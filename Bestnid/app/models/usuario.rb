class Usuario < ActiveRecord::Base
    validates :dni, length:{is: 8, :message => "con formato invalido. 
    	Debe contener 8 digitos."}, uniqueness: {case_sensitive: 
    	false ,message:"ya registrado. Por favor ingrese un DNI no registrado."} 
    validates :email, presence: true, uniqueness: {case_sensitive: false ,message: 
    	"ya registrado. Por favor ingrese un correo no registrado."}
    validates :tarjeta, presence: true, length:{is: 16, :message =>
    	"con formato invalido. Debe contener 16 digitos."}, uniqueness: 
    	{case_sensitive: false ,message: 
    	"ya registrada. Por favor ingrese una tarjeta no registrada."}
    validates :contrasenia, presence:true, length:{minimum: 7, :message =>
    	"-- La contrasenia debe contener como minimo 7 caracteres."}
	has_many :productos
  	has_many :ofertas
end