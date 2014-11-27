class OfertaController < ApplicationController
  before_action :Usuario_noLogueado, only: [:create, :new, :edit, :update]
  before_action :Usuario_noAdmin, only: [:create, :new, :edit, :update]

#Un usuario no logueado no podra ofertar
  def Usuario_noLogueado
     redirect_to(root_url) unless logged_in?
  end
 
  #Admin no podra ofertar por un producto
  def Usuario_noAdmin
     redirect_to(root_url) if current_usuario.admin?
  end

  def get_oferta
    @oferta = Oferta.find(params[:id])
  end

  def index
   @oferta = Oferta.all
  end

  def show
   @oferta=Oferta.find(params[:id])
  end

  def new
   @oferta = Oferta.new 
  end

  def edit
  end

  def update
  end

  def destroy
    @oferta.destroy
    redirect_to oferta_path, :notice => "Su oferta eliminada"
  end

  def create
   @oferta = Oferta.new(oferta_params)
   @oferta.producto=Producto.find(@oferta.producto_id)
   @oferta.usuario=current_usuario
   
    respond_to do |format|
      if not Oferta.exists?(:usuario_id => current_usuario.id, :producto_id =>@oferta.producto.id) and @oferta.save
        format.html { redirect_to @oferta, notice: 'Su oferta fue enviada exitosamente.' }
        format.json { render :show, status: :created, location: @oferta }
      else
        format.html{redirect_to(root_url)}
		flash[:danger] = 'Ya oferto este producto'
      end
    end
  end
  
    private
    def oferta_params           
       params.require(:oferta).permit(:motivo, :monto, :producto_id, :usuario_id)
    end
end