class SessionsController < ApplicationController
  def new
  end

  def create
    usuario	= Usuario.find_by(dni: params[:session][:dni])
    if usuario && usuario.authenticate(params[:session][:password])
	  log_in usuario
    flash[:notice] = 'Has iniciado sesion correctamente'
	  params[:session][:remember_me] == '1' ? remember(usuario) : forget(usuario)
	  remember usuario
      redirect_back_or usuario
    else
      flash[:notice] = 'Error al iniciar sesion'
      flash[:danger] = 'DNI o Password invalidos'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url, :notice => "Has cerrado sesion correctamente"
  end
end
