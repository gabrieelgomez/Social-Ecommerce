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

      #Rutas para el controlador Seller
      namespace :sellers do
        #Sellers controller
        get '/', to: 'sellers#all_sellers',           as: :all_sellers
        #Show
        get '/:id', to: 'show#show',                  as: :show_seller
        #Edit
        put '/:id/update', to: 'update#update',       as: :update_seller
        #Destroy
        delete '/:id/destroy', to: 'actions#destroy', as: :destroy_seller
      end

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

    end
  end

end
