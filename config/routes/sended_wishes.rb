# namespace :sended_wish do
#   post '/send_wish', to: 'action#send'
# end

scope module: 'wishes/sended_wishes' do
  post '/profile/:profile_id/wish/:wish_id/send_wish', to: 'action#send_wish'
end
