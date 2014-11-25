class CategoriaController < ApplicationController
  before_action :get_categoria, only: [:show,:destroy,:edit, :update]

  def get_categoria
    @categoria = Categoria.find(params[:id])
  end

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
	private
	def categorium_params
      params.require(:categoria).permit(:nombre)
    end
end
