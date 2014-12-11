class UsuariosController < ApplicationController
  before_action :logged_out_usuario, only: [:create, :new]
  before_action :logged_in_usuario, only: [:index, :edit, :update, :destroy]
  before_action :correct_usuario, only: [:edit, :update]
  #before_action :admin_usuario, only: :destroy

  def index
    @usuarios = Usuario.all
	if params[:start_date].present? and params[:end_date].present?
	  @usuarios = @usuarios.where("usuarios.created_at >= ? and usuarios.created_at <= ?", params[:start_date], params[:end_date])
	else
      if params[:start_date].present?
        @usuarios = @usuarios.where("usuarios.created_at >= ?", params[:start_date])
      end
      if params[:end_date].present?
        @usuarios = @usuarios.where("usuarios.created_at <= ?", params[:end_date])
      end
	end
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

  def confirmation
    @usuario = current_usuario
  end
  
  def destroy
      usua = current_usuario
      bool=false
	  usua.productos.each do |p|
	    if (p.disponible==true) and (p.ofertagano_id == nil) then
        	bool=true
	    end
	  end
	  if bool==false
	     usua.disponible = false
	     usua.ofertas.each do |o|
	       if (o.producto.ofertagano_id == nil) then
	    	   o.destroy
	       end
         end
    	 if usua.authenticate((params[:usuario][:password]))
		   usua.password=(params[:usuario][:password])
		   usua.save
		   log_out
           flash[:success] = "Usuario Eliminado"
		 else
		   flash[:success] = "Password Incorrecto"
		 end
     else
	     flash[:danger] = "El Usuario No Puede Ser Eliminado. Tiene Subastas Pendientes"
	  end
	  redirect_to root_url
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
      flash[:danger] = 'Ya tiene una cuenta'
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
