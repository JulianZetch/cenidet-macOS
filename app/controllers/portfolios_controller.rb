class PortfoliosController < ApplicationController
 def index
    @portfolio_items = Portfolio.all
 end
 # Creamos un nuevo articulo para el Porfafolio, este valigado
 # a create, similar a app/controllers/blog_controller
  def new
    @portfolio_item= Portfolio.new
  end

  def create
    @portfolio_item= Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))#A diferencia del blogs_controller, vamos a poner los parametros dentro de la variable, en lugar de un metodo

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Articulo de portafolio creado exitosamente' }
        #format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        #format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end
end


