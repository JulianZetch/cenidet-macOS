class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1}
  extend FriendlyId
# Para mas informacion visitala guia de FriendlyId: https://github.com/norman/friendly_id
  friendly_id :title, use: :slugged # Ahora nuestra url va a combinarse con el titulo del Blog!

 # Para validar que el blog contrenga Titulo y Cuerpo
 validates_presence_of :title, :body
end
