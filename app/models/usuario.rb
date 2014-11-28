class Usuario < ActiveRecord::Base
    attr_accessor :remember_token
    before_save { self.email = email.downcase }
    validates :dni, presence: true, length: 
    { in: 6..8 , message: "debe tener entre 6 y 8 numeros"},
     uniqueness: {case_sensitive: false ,message:"ya registrado. 
      Por favor ingrese un DNI no registrado."}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i		
    validates :email, presence: true, uniqueness: {case_sensitive: false ,message: 
    	"ya registrado. Por favor ingrese un correo no registrado."}, format: {with: VALID_EMAIL_REGEX, message: "formato invalido"}
    validates :tarjeta, presence: true, length:{is: 16, :message =>
    	"con formato invalido. Debe contener 16 digitos."}, uniqueness: 
    	{case_sensitive: false ,message: 
    	"ya registrada. Por favor ingrese una tarjeta no registrada."}

	 validate :tarjetaMenorAcero
   def tarjetaMenorAcero
      if(tarjeta<0) then
        errors.add(:tarjeta, "con formato invalido. Ingrese una tarjeta valida.")
      end  
   end

  has_secure_password
	validates :password, presence:true, length:{minimum: 7, :message => "debe contener como minimo 7 caracteres."}
	has_many :productos
  	has_many :ofertas
	def Usuario.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    def Usuario.new_token
      SecureRandom.urlsafe_base64
    end
    def remember
      self.remember_token = Usuario.new_token
      update_attribute(:remember_digest, Usuario.digest(remember_token))
    end
    def authenticated?(remember_token)
	  return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
	 def forget
      update_attribute(:remember_digest, nil)
    end
end