# Rails.application.routes.draw do
#   scope module: 'api' do
#     scope :v1 do
#       scope module: 'shopping_cars' do
#         get '/current_user', to: 'show#my_shop_car'
#       end
#     end
#   end
# end

scope module: 'shopping_carts' do
  get '/current_user/shop_cart', to: 'show#my_shop_cart'
end

namespace :shopping_carts do
  post '/add_product/:product_id', to: 'addition#add_product'
  delete '/remove_product/:item_id', to: 'subtraction#remove_product'
end
