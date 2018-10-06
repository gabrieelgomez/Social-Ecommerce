# --- Saved Offers routes
scope '/offer/:offer_id', module: 'offers/saved_offers' do
  post '/save', to: 'create#add'
  delete '/remove', to: 'destroy#remove'
end

scope module: 'offers' do
  namespace :saved_offers do
    get '/all_offers', to: 'show#saved_offers_user'
    get '/:saved_offer_id', to: 'show#show'
  end
end
# --- Saved Offers routes - end
