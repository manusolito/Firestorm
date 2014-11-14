class OfertasController < ApplicationController
 before_action :set_oferta, only: [:show, :edit, :update, :destroy]



  # GET /oferta
  # GET /oferta.json
  def index
    @ofertas = Oferta.all
  end

  # GET /oferta/1
  # GET /oferta/1.json
  def show
   @ofertas = Oferta.find(params[:id])
  end

  # GET /oferta/new
  def new
   @oferta = Oferta.new 
  end

  # GET /oferta/1/edit
  def edit
  end

  # POST /oferta
  # POST /oferta.json
  def create
   @oferta = Oferta.create(oferta_params)

    respond_to do |format|
      if @oferta.save
        format.html { redirect_to @oferta, notice: 'Su oferta fue enviada exitosamente!' }
        format.json { render :show, status: :created, location: @oferta}
      else
        format.html { render :new }
        format.json { render json: @oferta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oferta/1
  # PATCH/PUT /oferta/1.json
  def update
   
  end

  # DELETE /oferta/1
  # DELETE /oferta/1.json
  def destroy
  
  end

  def ad_params
    params.require(:oferta).permit(:motivo, :monto, :producto_id)
  end


    # Use callbacks to share common setup or constraints between actions.
    def set_oferta
      @oferta = Oferta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def oferta_params
      params.require(:oferta).permit(:motivo, :monto, :producto_id)
    end
end