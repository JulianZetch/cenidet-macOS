class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image
  # si cambiamos en portfolios_controller.rb  @portfolio_items = Portfolio.angular
  # va a darnos unicamente los articulos que tengan como subtitulo 'Angular'
  def self.angular
    where(subtitle: 'Angular')
  end
  # Este es por si queremos ver unicamente los Articulos que tengan "Ruby on Rails " como subtitulo
  scope :ruby_on_rails_portfolio_items, -> {where(subtitle: "Ruby on Rails")}
end
