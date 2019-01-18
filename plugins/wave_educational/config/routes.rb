Rails.application.routes.draw do

  scope module: 'api' do
    namespace :v1 do

      # WaveEducational
        namespace :wave_educational do

          scope module: 'teachers' do
            scope '/:type_teacher' do
              post '/create', to: 'create#create'
              get '/:teacher_id', to: 'show#show'
              get '/', to: 'show#index'
              put '/:teacher_id/update', to: 'update#update'
              delete '/:teacher_id/destroy', to: 'destroy#destroy'
            end
          end

        end
      end
    end

end
