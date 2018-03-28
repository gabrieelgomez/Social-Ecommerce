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
        get '/', to: 'show#index'
        get '/:id', to: 'show#show'
      end

      # --- Profiles route
      scope module: 'profiles' do
        post '/:type_profile/create', to: 'create#create'
      end
      # --- Profiles route - end

      # --- Sellers route
      namespace :sellers do
        # Sellers controller
        get '/', to: 'show#index'
        # Show
        get '/own', to: 'show#own_sellers'
        # Edit
        put '/:id/update', to: 'update#update'
        # Destroy
        delete '/:id/destroy', to: 'destroy#destroy'
      end
      # --- Sellers route - end

      # --- Pymes route
      get '/own_pymes', to: 'pymes/show#own_pymes'
      namespace :pymes do
        get '/', to: 'show#index'
        get '/:id', to: 'show#show'
        put '/:id/update', to: 'update#update'
        delete '/:id/destroy', to: 'destroy#destroy'
      end
      # --- Pymes route - end

      # --- Independents routes
      get '/own_independents', to: 'independents/show#own_independents'
      namespace :independents do
        get '/', to: 'show#index'
        get '/:id', to: 'show#show'
        put '/:id/update', to: 'update#update'
        delete '/:id/destroy', to: 'destroy#destroy'
      end
      # --- Independents routes - end

      # --- Product routes
      scope '/:type_profile/:profile_id' do
        resources :products, only: [:create, :update, :destroy], controller: 'products/action'
        resources :products, only: [:index, :show], controller: 'products/show'
        resources :products, only: [] do
          scope module: 'products' do
            post '/products_related', to: 'products_related/action#create'

            # --- Module custom fields
            get '/custom_fields', to: 'custom_fields/show#index'
            post '/custom_fields', to: 'custom_fields/action#create'
            delete '/custom_field/:field_id/destroy', to: 'custom_fields/action#destroy'
            # --- Module custom fields - end

            # --- Module options products
            get '/options', to: 'options/show#index'
            post '/options', to: 'options/action#create'
            delete '/option/:field_id/destroy', to: 'options/action#destroy'
            # --- Module options products - end

          end
        end
      end
      namespace :products do
        get '/own', to: 'show#show_own'

        # --- Categories Products routes
        namespace :categories do
          post '/', to: 'action#create'
          get '/', to: 'show#index'
          get '/:category_id', to: 'show#show'
          put '/:category_id/update', to: 'action#update'
          delete '/:category_id/destroy', to: 'action#destroy'
        end
        # --- Categories Products routes - end

      end
      # --- Product routes - end


    end
  end

end
