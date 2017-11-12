Rails.application.routes.draw do
  resources :portfolios

  # Se establecen las rutas
  get 'acerca-de', to: 'pages#about'

  get 'contacto', to:'pages#contact'

  resources :blogs
  # De esta forma la pagina de inicio sera home
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
