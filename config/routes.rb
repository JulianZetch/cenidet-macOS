Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # Se restringe la ruta para show
  resources :portfolios, except: [:show]
  get 'articulos-angular', to: 'portfolios#angular'
  # Se crea la ruta para show
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  # Se establecen las rutas

  get 'acerca-de', to: 'pages#about'

  get 'contacto', to:'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end


  # De esta forma la pagina de inicio sera home
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
