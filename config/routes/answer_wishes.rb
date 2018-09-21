scope '/sended_wish/:sended_wish_id', module: 'wishes/answer_wishes' do
  post '/answer', to: 'create#create'
end
