Rails.application.routes.draw do

  scope module: 'api' do
    namespace :v1 do

      # WaveEducational
        namespace :wave_educational do

          scope module: 'teachers' do
            scope '/:type_teacher' do
              post '/create', to: 'create#create'
            end
          end

        end
      end
    end

end
