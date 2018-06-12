# Rails.application.routes.draw do
#   scope module: 'api' do
#     scope :v1 do
#       scope module: 'shopping_cars' do
#         get '/current_user', to: 'show#my_shop_car'
#       end
#     end
#   end
# end

scope module: 'shopping_cars' do
  get '/current_user/shop_car', to: 'show#my_shop_car'
end
