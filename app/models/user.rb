class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #Si queremos que el usuario reciba un correo y de esta forma compruebe que es humano, entonces debemos incuir  :confirmable , si quieres que el usuario pueda registrarse con redessociales puedes usar :omniauthable , aunque recuerda que debes descomentar los campos en db/migrate/XXXXX_devise_create_users.rb
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Debemos asegurarnos que el usuario haya escrito el nombre
  ###validates_presence_of :name
  # Atributos Virtuales
  ###def first_name
    #Como ya ingresamos, self se refiere al User.name
    # Split es un metodo que separa una cadena mediante un espacio ejemplo : "Julian Zetina".split => ["Jilian", "Zetina"]
    ###self.name.split.first

 ### end

 ### def last_name

 ### end
end
