class ProductosController < ApplicationController

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
      params.require(:productos).permit(:nombre, :descripcion, :vencimiento, :categoria_id, :prourl)
    end
end
