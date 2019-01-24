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

          # Sections CRUD
          scope '/courses/:course_id' do
            namespace :sections do
              post '/create', to: 'create#create'
              get '/:section_id', to: 'show#show'
              get '/', to: 'show#index'
              put '/:section_id/update', to: 'update#update'
              delete '/:section_id/destroy', to: 'destroy#destroy'

              # Classes CRUD
              scope '/:section_id' do
                namespace :classes do
                  post '/create', to: 'create#create'
                  get '/:class_id', to: 'show#show'
                  get '/', to: 'show#index'
                  put '/:class_id/update', to: 'update#update'
                  delete '/:class_id/destroy', to: 'destroy#destroy'
                end
              end
              # Classes CRUD

            end
          end
          # Sections CRUD

          # Exams CRUD
          scope '/:examenable_type/:examenable_id' do
            namespace :exams do
              post '/create', to: 'create#create'
              get '/:exam_id', to: 'show#show'
              get '/', to: 'show#index'
              put '/:exam_id/update', to: 'update#update'
              delete '/:exam_id/destroy', to: 'destroy#destroy'
            end
          end
          # Exams CRUD

          # TypeQuestions CRUD
            namespace :exams do
              scope '/:exam_id' do
              namespace :type_questions do
                post '/create', to: 'create#create'
                get '/:type_question_id', to: 'show#show'
                get '/', to: 'show#index'
                put '/:type_question_id/update', to: 'update#update'
                delete '/:type_question_id/destroy', to: 'destroy#destroy'
              end
            end
          end
          # TypeQuestions CRUD


        end
      end
    end

end
