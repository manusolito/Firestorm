class OfertaController < ApplicationController
  before_action :Usuario_noLogueado, only: [:create, :new, :edit, :update]
  before_action :Usuario_noAdmin, only: [:create, :new, :edit, :update]
  before_action :get_oferta, only: [:edit, :update, :destroy]

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
   @ofertas = Oferta.all

   if params[:start_date].present? and params[:end_date].present?
    @oferta = @oferta.where("oferta.producto.diaventa >= ? and oferta.producto.diaventa <= ?", params[:start_date], params[:end_date])
   else
      if params[:start_date].present?
        @oferta = @oferta.where("oferta.producto.diaventa >= ?", params[:start_date])
      end
      if params[:end_date].present?
          @oferta = @oferta.where("oferta.producto.diaventa <= ?", params[:end_date])
      end
  
   end
  end

  def show
   @oferta=Oferta.find(params[:id])
  end

  def new
   @oferta = Oferta.new 
  end

  def edit
    @oferta = Oferta.find(params[:id])
  end

  def update
    @oferta= Oferta.find(params[:id])
   if @oferta.update_attributes(o_params)
    redirect_to @oferta, :notice => "Monto actualizado"
   else
    render :edit, :notice => "Error al actualizar el monto, intentelo nuevamente"
   end
  end
    
  def destroy
    @oferta = current_usuario.ofertas.find(params[:id])
    @oferta.destroy
    redirect_to oferta_path, :notice => "Su oferta fue eliminada"
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

    def o_params           
       params.require(:oferta).permit(:monto)
    end
end