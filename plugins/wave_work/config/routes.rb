Rails.application.routes.draw do

  scope module: 'api' do
    namespace :v1 do

      # WaveEducational
        namespace :wave_work do

          # JobOffers CRUD
          namespace :job_offers do
            get '/', to: 'show#index'
          end

          scope '/profile/:profile_id' do
            namespace :job_offers do
              post '/create', to: 'create#create'
              get '/:job_offer_id', to: 'show#show'
              get '/', to: 'show#index_per_profile'
              put '/:job_offer_id/update', to: 'update#update'
              delete '/:job_offer_id/destroy', to: 'destroy#destroy'
            end
          end
          # JobOffers CRUD

          # Areas CRUD
          namespace :areas do
            post '/create', to: 'create#create'
            get '/:area_id', to: 'show#show'
            get '/', to: 'show#index'
            put '/:area_id/update', to: 'update#update'
            delete '/:area_id/destroy', to: 'destroy#destroy'
          end
          # Areas CRUD

          # TypeJobs CRUD
          namespace :type_jobs do
            post '/create', to: 'create#create'
            get '/:type_job_id', to: 'show#show'
            get '/', to: 'show#index'
            put '/:type_job_id/update', to: 'update#update'
            delete '/:type_job_id/destroy', to: 'destroy#destroy'
          end
          # TypeJobs CRUD

          # TypeHierarchy CRUD
          namespace :type_hierarchies do
            post '/create', to: 'create#create'
            get '/:type_hierarchy_id', to: 'show#show'
            get '/', to: 'show#index'
            put '/:type_hierarchy_id/update', to: 'update#update'
            delete '/:type_hierarchy_id/destroy', to: 'destroy#destroy'
          end
          # TypeHierarchy CRUD

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
