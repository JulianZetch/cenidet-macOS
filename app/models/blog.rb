# Para mas informacion visitala guia de FriendlyId: https://github.com/norman/friendly_id
class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged # Ahora nuestra url va a combinarse con el titulo del Blog!
end
