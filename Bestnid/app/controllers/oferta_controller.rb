class OfertaController < ApplicationController
  before_action :get_oferta, only: [:show,:destroy,:edit, :update]
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
    @oferta.update(params.require(:oferta).permit([:motivo,:monto]))  
    redirect_to @oferta, notice: 'Su oferta fue enviada exitosamente.' 
  end

  def destroy 
  end

  def create
   @oferta = Oferta.new(oferta_params)

    respond_to do |format|
      if @oferta.save
        format.html { redirect_to @oferta, notice: 'Su oferta fue enviada exitosamente.' }
        format.json { render :show, status: :created, location: @oferta }
      else
        format.html { render :new }
        format.json { render json: @oferta.errors, status: :unprocessable_entity }
      end
    end
  end
  
    private
    def oferta_params           
       params.require(:oferta).permit(:motivo, :monto, :producto_id)
    end
end