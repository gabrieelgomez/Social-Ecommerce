# --- Saved Offers routes
scope '/offer/:offer_id' do
  scope module: 'saved_offers' do
    post '/save', to: 'create#add'
    delete '/remove', to: 'destroy#remove'
  end
end
# --- Saved Offers routes - end