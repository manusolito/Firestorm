class ProductosController < ApplicationController
  before_action :get_producto, only: [:show,:destroy, :update]
  
  before_action :Usuario_noLogueado, only: [:create, :new]
#Un usuario no logueado no podra subastar un producto
  def Usuario_noLogueado
     redirect_to(root_url) unless logged_in?
  end

  def get_producto
    @producto = Producto.find(params[:id])
  end
  def index
    @productos = Producto.all
  end

  def show
   @producto=Producto.find(params[:id])
  end

  def new
    @producto = Producto.new
  end

  def create
    @producto = Producto.new(producto_params)
	@producto.categoria(Categoria.find(@producto.categoria_id))

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'Producto creado con exito.' }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def producto_params
      params.require(:productos).permit(:nombre, :descripcion, :vencimiento, :prourl, :categoria_id )
    end
end
