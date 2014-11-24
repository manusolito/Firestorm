class SessionsController < ApplicationController
  def new
  end

  def create
    usuario	= Usuario.find_by(dni: params[:session][:dni])
    if usuario && usuario.authenticate(params[:session][:password])
	  log_in usuario
	  params[:session][:remember_me] == '1' ? remember(usuario) : forget(usuario)
	  remember usuario
      redirect_back_or usuario
    else
      flash[:danger] = 'DNI o Contrasenia invalidos'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
