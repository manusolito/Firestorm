class UsuariosController < ApplicationController
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

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
  
  end

	private
	def us_params
        params.require(:usuario).permit(:nombre, :dni, :email, :tarjeta, :contrasenia, :url)
     end
end
