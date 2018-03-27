Rails.application.routes.draw do
  # match '*path', :controller => 'application', :action => 'handle_options_request', :via => [:get, :post, :options]
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Route for frontend
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

      # --- Profiles route
      scope module: 'profiles' do
        post '/:type_profile/create', to: 'create#create', as: :create_profile
      end
      # --- Profiles route - end

      # --- Sellers route
      namespace :sellers do
        # Sellers controller
        get '/', to: 'show#index',                    as: :index_pymes
        # Show
        get '/own', to: 'show#own_sellers',           as: :own_seller
        # Edit
        put '/:id/update', to: 'update#update',       as: :update_seller
        # Destroy
        delete '/:id/destroy', to: 'destroy#destroy', as: :destroy_seller
      end
      # --- Sellers route - end

      # --- Pymes route
      get '/own_pymes', controller: 'pymes/show', action: 'own_pymes'
      namespace :pymes do
        get '/', to: 'show#index',
                 as: :index_pymes
        get '/:id', to: 'show#show',
                    as: :show_pyme
        put '/:id/update', to: 'update#update',
                           as: :update_pyme
        delete '/:id/destroy', to: 'destroy#destroy',
                               as: :destroy_pyme
      end
      # --- Pymes route - end

      # --- Product routes
      scope '/:type_profile/:profile_id' do
        resources :products, only: [:create, :update, :destroy], controller: 'products/action'
        resources :products, only: [:index, :show], controller: 'products/show'
        resources :products, only: [] do
          scope module: 'products' do
            post '/products_related', to: 'products_related/action#create'
          end     
        end
      end
      namespace :products do
        get '/own', controller: 'show', action: 'show_own'
      end
      # --- Product routes - end

      # --- Independents routes
      get '/own_independents', controller: 'independents/show', action: 'own_independents'
      namespace :independents do
        get '/', to: 'show#index',
                 as: :index_independents
        get '/:id', to: 'show#show',
                    as: :show_independent
        put '/:id/update', to: 'update#update',
                           as: :update_independent
        delete '/:id/destroy', to: 'destroy#destroy',
                               as: :destroy_independent
      end
      # --- Independents routes - end
    end
  end
  # global options responder -> makes sure OPTION request for CORS endpoints work
  # match '*path', via: [:options], to: lambda {|_| [204, { 'Content-Type' => 'text/plain' }]}
end
