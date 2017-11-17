class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #Si queremos que el usuario reciba un correo y de esta forma compruebe que es humano, entonces debemos incuir  :confirmable , si quieres que el usuario pueda registrarse con redessociales puedes usar :omniauthable , aunque recuerda que debes descomentar los campos en db/migrate/XXXXX_devise_create_users.rb
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
