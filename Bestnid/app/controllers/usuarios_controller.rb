class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
  
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
  
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
   
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
   
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
   
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      
    end
end
