Rails.application.routes.draw do
  # match '*path', :controller => 'application', :action => 'handle_options_request', :via => [:get, :post, :options]
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Route for frontend
  scope module: 'api' do
    namespace :v1 do

      put 'products/:product_id/upload/:type_upload/:file_id/delete', to: 'products/uploaders/uploaders#destroy'

      # Routes for custom reset password
      # --- Posts routes
      draw :posts
      # --- Posts routes - end

      # Routes for custom reset password
      scope module: 'users' do
        post 'auth/password/reset', to: 'password_reset#reset'
        get 'countries', to: 'show#countries'
      end

      # Rutas para métodos del controlador API
      # ActionCable route
      mount ActionCable.server => '/cable'

      # Chat module
      scope module: 'chat' do
        namespace :conversations do
          post '/create', to: 'create#create'
          get '/my_conversations', to: 'show#current_user_conversations'
          get '/own_profile_conversations', to: 'show#own_profiles_conversations'
          # delete '/:id/destroy', to: 'destroy#destroy'
        end
        namespace :messages do
          scope '/:conversation_id' do
            post '/create', to: 'create#create'
            post '/make_read', to: 'action#make_them_read'
          end
        end
      end
      # Chat module - end

      # Shopping car
      draw :shopping_carts
      # Shopping car - end

      # Concerns routes
      draw :concerns
      # Concerns routes - end

      # Wishes routes
      draw :wishes

      # Rutas para el controlador User
      draw :users

      # Location routes
      draw :locations
      # Location routes - end

      # Geolocation route
      namespace :geolocation do
        post '/look_for', to: 'gps#profiles_per_categories'
      end
      # Geolocation route - end

      # Search routes
      namespace :searchs do
        get '/', to: 'search#global_search'
        get '/:type_search', to: 'search#filters_search'
        get '/locations/response', to: 'search#locations_response'

        # Routes Services
          get '/services/suggest', to: 'services_profiles#suggest_query'
          get '/services/profiles', to: 'services_profiles#service_profile'
          get '/services/profiles/by_products_status', to: 'services_profiles#service_by_products_status'
          get '/services/products', to: 'services_products#service_product'
          get '/services/filters_by_cat', to: 'services#filters_by_cat'
        # End Routes Services

      end
      # Search routes - end

      # --- Categories Products routes
      namespace :profiles do

        get '/all', to: 'profiles#all_profiles'

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
      draw :comments
      # --- Comments route - end


      # --- Profiles route
      scope module: 'profiles' do
        scope '/:type_profile' do
          get '/new', to: 'create#new'
          post '/create', to: 'create#create'
        end

        #For SocialAccounts
        scope '/:type_profile/:profile_id/social_accounts' do
          get '/show', to: 'social_accounts/social_accounts#show'
          put '/update', to: 'social_accounts/social_accounts#update'
        end

        #For Schedules
        scope '/:type_profile/:profile_id/schedules' do
          get '/show', to: 'schedules/schedules#show'
          put '/update', to: 'schedules/schedules#update'
        end


      end
      # --- Profiles route - end

      # --- Sellers route
      draw :sellers
      # --- Sellers route - end

      # --- Pymes route
      draw :pymes
      # --- Pymes route - end

      # --- Independents routes
      draw :independents
      # --- Independents routes - end

      # --- Offer route
      draw :offers
      # --- Offer route - end

      draw :saved_offers

      # --- Product routes and related to them
      scope '/:type_profile/:profile_id' do
        # Product routes
        draw :products
        # Product routes - end
        scope '/products/:product_id', module: 'products' do

          draw :products_related

          # --- Module custom fields
          draw :custom_fields
          # --- Module custom fields - end

          # --- Module options products
          draw :options
          # --- Module options products - end

          # --- Module price_range products
          draw :price_ranges
          # --- Module price_range products - end

        end
      end
      namespace :products do
        get '/all', to: 'show#all'
      end
      # --- Product routes and related to them

      # --- Subcategories Products routes
      draw :subcategories
      # --- Subcategories Products routes - end

      # --- Followers route
      draw :followers
      # --- Followers route - end

      # --- Rates Profiles routes
      draw :rates
      # --- Rates Profiles route - end

      # --- Sended wish routes
      draw :sended_wishes
      # --- Sended wish routes - end

      # --- Answer wish routes
      draw :answer_wishes
      # --- Answer wish routes - end

      # --- Notifications route
      draw :notifications
      # --- Notifications route - end

      # --- Managers route
      draw :managers
      # --- Managers route - end

      # --- Managers route
      draw :managers_profiles
      # --- Managers route - end

    end
  end
end
