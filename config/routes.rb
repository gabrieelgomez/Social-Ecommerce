Rails.application.routes.draw do
  # match '*path', :controller => 'application', :action => 'handle_options_request', :via => [:get, :post, :options]
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Route for frontend
  scope module: 'api' do
    namespace :v1 do
      # Rutas para métodos del controlador API


      # Rutas para el controlador User
      namespace :users do
        get '/current', to: 'show#profile'
        get '/', to: 'show#index'
        get '/current', to: 'show#get_current_user'
        get '/:id', to: 'show#show'
      end

      # Location routes
      namespace :locations do
        scope '/:locatable_type/:locatable_id' do
          post '/create', to: 'create#create'
        end
      end
      # Location routes - end

      # Geolocation route
      namespace :geolocation do
        post '/look_for', to: 'gps#profiles_per_categories'
      end
      # Geolocation route - end

      # Search routes
      namespace :search do
        post '/', to: 'search#global_search'
      end
      # Search routes - end

      # --- Categories Products routes
      namespace :profiles do
        namespace :categories do
          post '/', to: 'actions#create'
          get '/', to: 'show#index'
          get '/:category_id', to: 'show#show'
          put '/:category_id/update', to: 'actions#update'
          delete '/:category_id/destroy', to: 'actions#destroy'
        end
      end
      # --- Categories Products routes - end

      # --- Comments route
      namespace :comments do
        post '/new', to: 'create#create'
        get '/:type_profile/:profile_id', to: 'show#index'
        get '/:comment_id', to: 'show#show'
        put '/:comment_id/update', to: 'update#update'
        delete '/:comment_id/destroy', to: 'destroy#destroy'
      end
      # --- Comments route - end


      # --- Profiles route
      scope module: 'profiles' do
        scope '/:type_profile' do
          get '/new', to: 'create#new'
          post '/create', to: 'create#create'
        end
      end
      # --- Profiles route - end

      # --- Sellers route
      namespace :sellers do
        get '/own', to: 'show#own_sellers'
        get '/', to: 'show#index'
        put '/:id/update', to: 'update#update'
        put '/:id/destroy', to: 'destroy#destroy'
      end
      # --- Sellers route - end

      # --- Pymes route

      namespace :pymes do
        get '/own', to: 'show#own_pymes'
        get '/', to: 'show#index'
        get '/:id', to: 'show#show'
        put '/:id/update', to: 'update#update'
        put '/:id/destroy', to: 'destroy#destroy'
      end
      # --- Pymes route - end

      # --- Independents routes

      namespace :independents do
        get '/own', to: 'show#own_independents'
        get '/', to: 'show#index'
        get '/:id', to: 'show#show'
        put '/:id/update', to: 'update#update'
        put '/:id/destroy', to: 'destroy#destroy'
      end
      # --- Independents routes - end

      # --- Offer route
      scope '/:type_profile/:profile_id' do
        namespace :offers do
          post '/', to: 'create#create'
        end
      end

      namespace :offers do
        get '/current_user', to: 'show#current_user_offers'
        get '/', to: 'show#index'
        get '/:username', to: 'show#user_offers'
        get '/:id', to: 'show#show'
        put '/:id/update', to: 'update#update'
        delete '/:id/destroy', to: 'destroy#destroy'
      end
      # --- Offer route - end


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
            delete '/custom_fields/:field_id/destroy', to: 'custom_fields/action#destroy'
            # --- Module custom fields - end

            # --- Module options products
            get '/options', to: 'options/show#index'
            post '/options', to: 'options/action#create'
            delete '/options/:option_id/destroy', to: 'options/action#destroy'
            # --- Module options products - end

            # --- Module price_range products

            get '/price_ranges', to: 'price_ranges/show#index'
            post '/price_ranges', to: 'price_ranges/action#create'
            put '/price_ranges/:price_range_id/update', to: 'price_ranges/action#update'
            delete '/price_ranges/:price_range_id/destroy', to: 'price_ranges/action#destroy'

            # --- Module price_range products - end
          end
        end
      end
      namespace :products do
        get '/own', to: 'show#show_own'
        get '/search', to: 'show#search_tag'
        # --- Subcategories Products routes
        namespace :subcategories do
          post '/', to: 'action#create'
          get '/', to: 'show#index'
          get '/:subcategory_id', to: 'show#show'
          put '/:subcategory_id/update', to: 'action#update'
          delete '/:subcategory_id/destroy', to: 'action#destroy'
        end
        # --- Subcategories Products routes - end
      end
      # --- Product routes - end

      # --- Followers route
      scope module: 'followers' do

        # --- Users Following routes
        namespace :users do
          #Crear seguidor
          get '/follow/:user_id', to: 'action#create_follow'
          #Listar todos los seguidores de current_v1_user
          get '/all/followers', to: 'action#followers'
          #Listar los que sigue current_v1_user
          get '/all/following', to: 'action#following'
          #Dejar de seguir un usuario a partir de current_v1_user
          post '/stop/unfollow', to: 'action#unfollow'
        end

        # /current_user/following/seller

        # --- Profiles Following routes
        # namespace :profiles do
        scope module: 'profiles' do
          #Crear seguidor
          get 'current_user/follow/:type_profile/:profile_id', to: 'action#create_follow'
          #Listar todos los seguidores de current_v1_profile
          get 'current_user/followers/:type_profile/:profile_id', to: 'action#followers'
          #Listar los que sigue current_v1_profile
          get 'current_user/following/:type_profile', to: 'action#following'
          #Dejar de seguir un usuario a partir de current_v1_profile
          post 'current_user/unfollow/:type_profile/:profile_id/', to: 'action#unfollow'
        end

      end
      # --- Followers route - end

      # --- Rates Profiles routes
      namespace :rates do
        post '/current_user/:profile_id', to: 'actions#create'
        delete '/current_user/:id/destroy', to: 'actions#destroy'
      end
      # --- Rates Profiles route - end

    end
  end
end
