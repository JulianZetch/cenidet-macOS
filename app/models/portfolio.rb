class Portfolio < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image
  # si cambiamos en portfolios_controller.rb  @portfolio_items = Portfolio.angular
  # va a darnos unicamente los articulos que tengan como subtitulo 'Angular'
  def self.angular
    where(subtitle: 'Angular')
  end
  # Este es por si queremos ver unicamente los Articulos que tengan "Ruby on Rails " como subtitulo
  scope :ruby_on_rails_portfolio_items, -> {where(subtitle: "Ruby on Rails")}

  after_initialize :set_defaults
  # Los valores por defecto en las imagenes para que al crear
  # un nuevo articulo, automaticamente se de este tamano a las imagenes
  # Ten en cuenta que ||= significa que si main_image o thumb_image son nil
  # Entonces agrega lo que esta despues del igual, si no son nil entoces no hace nada
  def set_defaults
    #Aqui se pueden cambiar las dimensiones de la imagen por default
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end