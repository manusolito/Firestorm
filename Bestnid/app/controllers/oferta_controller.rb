class OfertaController < ApplicationController

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