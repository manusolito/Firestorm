class UsuariosController < ApplicationController
<<<<<<< HEAD
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

=======
>>>>>>> origin/categorias
  # GET /usuarios
  # GET /usuarios.json
  def index
  
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
def show
   
   @usuario = Usuario.find(params[:id])
end

  # GET /usuarios/new

  def new
    @usuario = Usuario.new
  
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.json


def create
<<<<<<< HEAD
  @usuario = Usuario.create(ad_params)
  @usuario.save

   if @usuario.save
     flash[:success] = "Bienvenido, gracias por registrarse a Bestnid.!"
     flash[:success] = "Sus datos personales son:!"
     redirect_to @usuario
   else 
    render 'new'
   end 
end

public

def ad_params
  params.require(:usuario).permit(:nombre, :dni, :email, :tarjeta, :contrasenia)
=======
    @usuario = Usuario.new(us_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario creado con exito.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end

>>>>>>> origin/categorias
end



  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
def update
   @nombre = params[:usuario]["nombre"];
   @dni = params[:usuario]["dni"];
   @email = params[:usuario]["email"];
   @tarjeta = params[:usuario]["tarjeta"];
   @contrasenia = params[:usuario]["contrasenia"];
   @usuario = Usuario.find(params[:id]);
   @usuario.nombre = @nombre;
   @usuario.dni = @dni;
   @usuario.email = @email;
   @usuario.tarjeta = @tarjeta;
   @usuario.contrasenia = @contrasenia;
   if @usuario.save()
      redirect_to @usuario
   else
      render "edit";
   end
end

<<<<<<< HEAD

  


=======
>>>>>>> origin/categorias
  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
  
  end

<<<<<<< HEAD
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
   
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      
    end
=======
	private
	def us_params
        params.require(:usuario).permit(:nombre, :dni, :email, :tarjeta, :contrasenia, :url)
     end
>>>>>>> origin/categorias
end
