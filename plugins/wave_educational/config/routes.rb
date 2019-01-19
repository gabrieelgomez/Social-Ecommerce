Rails.application.routes.draw do

  scope module: 'api' do
    namespace :v1 do

      # WaveEducational
        namespace :wave_educational do

          # Teachers CRUD
          namespace :teachers do
            post '/create', to: 'create#create'
            get '/:teacher_id', to: 'show#show'
            get '/', to: 'show#index'
            put '/:teacher_id/update', to: 'update#update'
            delete '/:teacher_id/destroy', to: 'destroy#destroy'

            # Courses CRUD
            scope '/:teacher_id' do
              namespace :courses do
                post '/create', to: 'create#create'
                get '/:course_id', to: 'show#show'
                get '/', to: 'show#index'
                put '/:course_id/update', to: 'update#update'
                delete '/:course_id/destroy', to: 'destroy#destroy'
              end
            end
            # Courses CRUD

          end
          # Teachers CRUD
        end
      end
    end

end
