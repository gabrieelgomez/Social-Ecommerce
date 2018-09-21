get '/price_ranges', to: 'price_ranges/show#index'
post '/price_ranges', to: 'price_ranges/action#create'
put '/price_ranges/:price_range_id/update', to: 'price_ranges/action#update'
delete '/price_ranges/:price_range_id/destroy', to: 'price_ranges/action#destroy'
