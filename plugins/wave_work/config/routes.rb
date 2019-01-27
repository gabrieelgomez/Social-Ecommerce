Rails.application.routes.draw do

  scope module: 'api' do
    namespace :v1 do

      # WaveEducational
        namespace :wave_work do

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

        end
      end
    end

end
