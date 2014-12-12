class ContactosController < ApplicationController
  before_action :logged_in_admin, only: [:destroy, :index]
  before_action :no_logged_in_admin, only: [:new]
  before_action :logged_in, only: [:new, :destroy, :show, :index]
 
  def index
    @contactos = Contacto.all
  end

  def show
  @contacto = Contacto.find(params[:id])
  end
    
  def new
    @contacto = Contacto.new
  end
  
  def create
    @contacto = Contacto.new(contact_params)
	@contacto.usuario=current_usuario

    respond_to do |format|
      if @contacto.save
        format.html { redirect_to @contacto, notice: 'Mensaje Enviado.' }
        format.json { render :show, status: :created, location: @contacto }
      else
        format.html { render :new }
        format.json { render json: @contacto.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
  	@contacto = Contacto.find(params[:id])
	@contacto.destroy
	redirect_to contactos_path, :notice => "Mensaje eliminado"
  end
  
	private
	def contact_params
      params.require(:contactos).permit(:mensaje, :asunto)
    end
	
  def logged_in_admin
    if !current_usuario.admin?
	   redirect_to(root_url)
       flash[:danger] = "No Tiene Los Permisos Para Acceder Alli."
	end
  end
  
    def logged_in
      if !logged_in?
	    store_location
        flash[:danger] = "Por Favor Inicie Sesion."
        redirect_to login_url
      end
	end
	
    def no_logged_in_admin
      if current_usuario.admin?
	     redirect_to(root_url)
		 flash[:danger] = "Zona de usuarios."
	  end
    end
end