class PortfoliosController < ApplicationController
 def index
    @portfolio_items = Portfolio.all
 end

 def angular
    @angular_portfolio_items = Portfolio.angular
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
    # El metodo editar a diferencia del new, necesita un id para saber cual editar
    # por ejemplo una ruta seria : http://localhost:3000/portfolios/5/edit
  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end
    # Metodo creado para actualizar los datos editados
  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item .update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Cambios del articulo guardados' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        #format.json { render json: @portfolio_item .errors, status: :unprocessable_entity }
      end
    end
  end
    #Metodo utulizado para mostrar los datos al dar clic en el titulo
  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

    #Escogi destroy en lugar de delete para que sea mas especifico y cuidadoso eliminar un dato de la BD
  def destroy
    #Realiza la busqueda
    @portfolio_item = Portfolio.find(params[:id])
    #Elimina o destruye el articulo
    @portfolio_item.destroy
    #Redirecciona la pagina
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'El articulo ha sido eliminado' }
      format.json { head :no_content }
    end
  end
end


