Rails.application.routes.draw do

  # ActionCable route
  mount ActionCable.server => '/cable'

  # match '*path', :controller => 'application', :action => 'handle_options_request', :via => [:get, :post, :options]
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth', defaults: { format: :json }
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

      # --- Advertise
      draw :advertises
      # --- Advertise - end

      # Routes for custom reset password
      scope module: 'users' do
        post 'auth/password/reset', to: 'password_reset#reset'
        post 'auth/password/regenerate', to: 'password_reset#regenerate'
        get 'countries', to: 'show#countries'
        post 'wocommerce_webhook', to: 'show#wocommerce_webhook'
      end

      # Rutas para métodos del controlador API

      # Chat module
      scope module: 'chat' do
        namespace :conversations do
          post '/create', to: 'create#create'
          get '/my_conversations', to: 'show#current_user_conversations'
          get '/own_profile_conversations', to: 'show#own_profiles_conversations'
          delete '/:conversation_id/destroy', to: 'destroy#destroy'
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

      # Contacts routes
      draw :contacts
      # Contacts routes - end

      # Contact Types routes
      draw :contact_types
      # Contact Types routes - end

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

      # Customer Management
      draw :customer_managements
      # Customer Management - end

      # Clients
      draw :clients
      # Clients - end

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
        get '/services/profiles/by_products_nested_categories', to: 'services_profiles#profiles_by_cat_nested_products'
        get '/services/products', to: 'services_products#service_product'
        get '/services/filters_by_cat', to: 'services#filters_by_cat'
        # End Routes Services

      end
      # Search routes - end

      # Services routes
      namespace :services do
        get '/home', to: 'home#home'
        get '/products_by_filters', to: 'services#products_filters'
      end
      # Services routes - end

      # --- Comments route
      draw :cotizations
      # --- Comments route - end

      # --- Comments route
      draw :comments
      # --- Comments route - end

      # --- Likes route
      draw :likes
      # --- Likes route - end

      # --- Job Offers
      draw :job_offers
      # --- Job Offers - end

      # --- Questions route
      draw :questions
      # --- Questions route - end

      # --- QOptions
      draw :q_options
      # --- QOptions - end

      # --- Postulations
      draw :postulations
      # --- Postulations - end

      # --- Profiles route
      draw :profiles
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

      namespace :products do
        get '/sort_by_wishes', to: 'show#sorting_by'
        put '/:id/status', to: 'products#status'
        get '/:id/wished', to: 'products#wished'
        put '/:product_id/unwish', to: 'action#unwish'
      end

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

      # --- Managers Profiles route
      draw :managers_profiles
      # --- Managers Profiles route - end

      # --- Statistics route
      draw :statistics
      # --- Statistics route - end

      # --- Wallets route
      draw :wallets
      # --- Wallets route - end

      # --- EducationalDescriptions route
      draw :educational_descriptions
      # --- EducationalDescriptions route - end

      # Intranet routes engine
      mount Intranet::Engine, at: '/', as: 'intranet'

      # WaveCitizen routes engine
      mount WaveCitizen::Engine, at: '/', as: 'wave_citizen'

      # WaveEducational routes engine
      mount WaveEducational::Engine, at: '/', as: 'wave_educational'

      # WaveWork routes engine
      mount WaveWork::Engine, at: '/', as: 'wave_work'

      # WaveCitizen routes engine
      # mount WaveCitizen::Engine, at: '/', as: 'wave_citizen'

    end
  end
end
