class UsuariosController < ApplicationController
  before_action :logged_out_usuario, only: [:create, :new]
  before_action :logged_in_usuario, only: [:index, :edit, :update, :destroy]
  before_action :correct_usuario, only: [:edit, :update]
  #before_action :admin_usuario, only: :destroy

  def index
    @usuarios = Usuario.all
  end

def show
   @usuario = Usuario.find(params[:id])
end


  def new
    @usuario = Usuario.new
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

def create
    @usuario = Usuario.new(us_params)

    respond_to do |format|
      if @usuario.save
	    log_in @usuario
        format.html { redirect_to @usuario, notice: 'Bienvenido a Bestnid!' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end

end

  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update_attributes(us_params)
	  flash[:success] = "Perfil Actualizado"
      redirect_to @usuario
    else
      render 'edit'
    end
  end

  def destroy
    Usuario.find(params[:id]).destroy
    flash[:success] = "Usuario Eliminado"
    redirect_to usuarios_url
  end
  
  private
	def us_params
        params.require(:usuario).permit(:nombre, :dni, :email, :tarjeta, :password, :password_confirmation, :url)
    end
  def logged_in_usuario
      unless logged_in?
	    store_location
        flash[:danger] = "Por Favor Inicie Sesion."
        redirect_to login_url
      end
   end
   def logged_out_usuario
    if logged_in?
	  store_location
      flash[:danger] = "Ya tiene una cuenta."
      redirect_to root_url
    end
   end
   def correct_usuario
      @usuario = Usuario.find(params[:id])
      redirect_to(root_url) unless current_usuario?(@usuario)
   end
   def admin_usuario
     redirect_to(root_url) unless current_usuario.admin?
   end
end
