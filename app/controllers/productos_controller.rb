class ProductosController < ApplicationController
  before_action :get_producto, only: [:show,:destroy, :update, :ganador]
  before_action :Usuario_noLogueado, only: [:create, :new]
  before_action :Usuario_noAdmin, only: [:create, :new, :edit, :update]

#Un usuario no logueado no podra subastar un producto
  def Usuario_noLogueado
     redirect_to(root_url) unless logged_in?
  end
 
 
  #Admin no podra subastar un producto
  def Usuario_noAdmin
     redirect_to(root_url) if current_usuario.admin?
  end
 
  def update
    @producto= Producto.find(params[:id])
	#@producto.categoria(Categoria.find(@producto.categoria_id))
   if @producto.update_attributes(producto_params)
	  flash[:success] = "Producto Actualizado"
      redirect_to @producto
    else
      render 'edit'
    end
  end
  
  def edit
    @producto = Producto.find(params[:id])
  end

  def get_producto
    @producto = Producto.find(params[:id])
  end
  
  def index
    @productos = Producto.all
	if params[:mis_productos].present? and params[:disponible].present?
	  @productos = @productos.where("productos.usuario_id = ? and productos.vencimiento > ?", current_usuario.id, DateTime.now.to_date)
	else
      if params[:mis_productos].present?
	    @productos = @productos.where("productos.usuario_id = ?", current_usuario.id)
      end
      if params[:disponible].present?
        @productos = @productos.where("productos.vencimiento > ?", DateTime.now.to_date)
      end
	end
  end

  def estadistica
   @productos = Producto.all
   @productos = @productos.where.not(ofertagano_id: nil)

   if params[:start_date].present? and params[:end_date].present?
    @productos = @productos.where("productos.diaventa >= ? and productos.diaventa <= ?", params[:start_date],params[:end_date])
   else
      if params[:start_date].present?
        @productos = @productos.where("productos.diaventa >= ?", params[:start_date])
      end
      if params[:end_date].present?
        @productos = @productos.where("productos.diaventa <= ?", params[:end_date])
      end
   end
   @productos=@productos.joins(:usuario).select("usuarios.url, usuarios.nombre, count(productos.usuario_id) as ventas_count").group('usuarios.url, usuarios.nombre').order("ventas_count desc")
  end

  def show
   @producto=Producto.find(params[:id])
  end

  def new
    @producto = Producto.new
  end

  def create
    @producto = Producto.new(product_params)
	@producto.usuario=current_usuario
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
  def destroy
      @producto.disponible = false
         @producto.save
           flash[:success] = "Producto Eliminado"
           redirect_to producto_url
    end
  
  def ganador
     @ide =  params[:ofertagano_id]
     @producto.ofertagano_id = @ide
     @producto.diaventa = DateTime.now.to_date
     @producto.save(:validate => false)
     if @producto.save(:validate => false)
         redirect_to welcome_index_path, :notice => "Ganador elegido" 
     else
        redirect_to productos_path, :notice => "Error al elegir el ganador. Intentelo nuevamente"
     end
  end
  
  private
    def producto_params
      params.require(:producto).permit(:nombre, :descripcion, :vencimiento, :prourl, :categoria_id, :ofertagano_id , :diaventa)
    end
	def product_params
      params.require(:productos).permit(:nombre, :descripcion, :vencimiento, :prourl, :categoria_id, :ofertagano_id , :diaventa)
    end
end
