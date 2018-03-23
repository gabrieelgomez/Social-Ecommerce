Rails.application.routes.draw do
  #match '*path', :controller => 'application', :action => 'handle_options_request', :via => [:get, :post, :options]
  mount_devise_token_auth_for 'User', at: 'auth'
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

      #Rutas para el controlador Profile
      namespace :profiles do
        get '/new', to: 'create#new', as: :new_profile
        post '/', to: 'create#create', as: :create_profile
        get '/', to: 'show#index', as: :profiles
        get '/:id', to: 'show#show', as: :show_profile
      end

      #Rutas para el controlador Seller
      namespace :sellers do
        #Sellers controller
        get '/', to: 'show#index',                    as: :index_pymes
        #Show
        get '/own', to: 'show#own_sellers',           as: :own_seller
        #Edit
        put '/:id/update', to: 'update#update',       as: :update_seller
        #Destroy
        delete '/:id/destroy', to: 'destroy#destroy', as: :destroy_seller
      end

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
        # get '/own', to: 'own_pymes#show',
        #             as: :own_pymes,
        #             on: :member
        # match '/own' => 'show#own_pymes', :via => :get

      end

      # get '/:type_profile/:id', controller: 'products/products' do
      #   resources :products, only: [:index, :create, :update, :destroy], controller: 'products/products'
      # end
      scope '/:type_profile/:profile_id' do
        resources :products, only: [:create, :update, :destroy], controller: 'products/action'
        resources :products, only: [:index, :show], controller: 'products/show'
      end
      namespace :products do
        get '/own', controller: 'show', action: 'show_own'
      end

      # map.resources :products, namespace: ':type_profile/:id', controller: 'products/products'
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
    end
  end

  # global options responder -> makes sure OPTION request for CORS endpoints work
  # match '*path', via: [:options], to: lambda {|_| [204, { 'Content-Type' => 'text/plain' }]}

end
