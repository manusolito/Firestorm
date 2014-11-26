class CategoriaController < ApplicationController
  before_action :logged_in_admin, only: [:new, :create, :edit, :update, :destroy]
  
  #Un usuario no admin no podra crear, edit , etc categoria

  def index
    @categoria = Categoria.all
  end


  def show
  @categoria=Categoria.find(params[:id])
  end
    
  def new
    @categoria=Categoria.new
  end
  
  def create
    @categoria = Categoria.new(categorium_params)
    @asd=@categoria.nombre
	if Categoria.where(:nombre => @asd).present? and not Categoria.where(:nombre => @asd).first.disponible
	  @categoria = Categoria.find(Categoria.where(:nombre => @asd).first.id)
	  @categoria.disponible = true
	end

    respond_to do |format|
      if @categoria.save
        format.html { redirect_to @categoria, notice: 'Categoria creada con exito.' }
        format.json { render :show, status: :created, location: @categoria }
      else
        format.html { render :new }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
  	@categoria = Categoria.find(params[:id])
	if @categoria.productos.count == 0
	   @categoria.destroy
	   flash[:success] = "Categoria Eliminada"
       redirect_to categoria_url
	else
	   bool=false
	   @categoria.productos.each do |p|
	     if p.disponible==true
		   	bool=true
	     end
	   end
	   if bool==false
	     @categoria.disponible = false
	     @categoria.save
         flash[:success] = "Categoria Eliminada"
         redirect_to categoria_url
	   else
	     flash[:success] = "La Categoria No Puede Ser Eliminada"
         redirect_to categoria_url
	   end
	end
  end
  
	private
	def categorium_params
      params.require(:categoria).permit(:nombre)
    end
	def logged_in_admin
      if !logged_in?
	    store_location
        flash[:danger] = "Por Favor Inicie Sesion."
        redirect_to login_url
	  elseif !current_usuario.admin?
	    redirect_to(root_url)
		flash[:danger] = "No Tiene Los Permisos Para Acceder Alli."
	  end
    end
end
