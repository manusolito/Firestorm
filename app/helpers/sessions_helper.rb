module SessionsHelper

  def log_in(usuario)
    session[:usuario_id] = usuario.id
  end
  
  def remember(usuario)
    usuario.remember
    cookies.permanent.signed[:usuario_id] = usuario.id
    cookies.permanent[:remember_token] = usuario.remember_token
  end

  def current_usuario
    if (usuario_id = session[:usuario_id])
      @current_usuario ||= Usuario.find_by(id: usuario_id)
    elsif (usuario_id = cookies.signed[:usuario_id])
      usuario = Usuario.find_by(id: usuario_id)
      if usuario && usuario.authenticated?(cookies[:remember_token])
        log_in usuario
        @current_usuario = usuario
      end
    end
  end
  
  def current_usuario?(usuario)
    usuario == current_usuario
  end

  def logged_in?
    !current_usuario.nil?
  end
  
  def forget(usuario)
    usuario.forget
    cookies.delete(:usuario_id)
    cookies.delete(:remember_token)
  end
    def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  
  def log_out
    forget(current_usuario)
    session.delete(:usuario_id)
    @current_usuario = nil
  end
end