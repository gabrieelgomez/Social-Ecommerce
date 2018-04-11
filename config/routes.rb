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


      #Rutas para el controlador User
      namespace :users do
        get '/current', to: 'show#profile'
        get '/', to: 'show#index'
        get '/current', to: 'show#get_current_user'
        get '/:id', to: 'show#show'
      end

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
            delete '/custom_field/:field_id/destroy', to: 'custom_fields/action#destroy'
            # --- Module custom fields - end

            # --- Module options products
            get '/options', to: 'options/show#index'
            post '/options', to: 'options/action#create'
            delete '/option/:field_id/destroy', to: 'options/action#destroy'
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
        # --- Categories Products routes
        namespace :subcategories do
          post '/', to: 'action#create'
          get '/', to: 'show#index'
          get '/:subcategory_id', to: 'show#show'
          put '/:subcategory_id/update', to: 'action#update'
          delete '/:subcategory_id/destroy', to: 'action#destroy'
        end
        # --- Categories Products routes - end
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
          post '/mod/unfollow', to: 'action#unfollow'
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


    end
  end
end
