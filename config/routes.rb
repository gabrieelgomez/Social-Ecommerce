Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: 'api' do
    namespace :v1 do
      #Rutas para métodos del controlador API
      get '/current', to: 'api#index'

      #Rutas para el controlador User
      namespace :users do
        get '/', to: 'show#index', as: :users
        get '/:id', to: 'show#show', as: :show_user
        # resources :users, only: [:index, :show]
      end

      #Rutas para el controlador Profile
      namespace :profiles do
        get '/new', to: 'create#new', as: :new_profile
        post '/', to: 'create#create', as: :create_profile
        get '/', to: 'show#index', as: :profiles
        get '/:id', to: 'show#show', as: :show_profile
      end

    end
  end

end
