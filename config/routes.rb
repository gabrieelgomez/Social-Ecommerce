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
      draw :comments
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
    end
  end
end
