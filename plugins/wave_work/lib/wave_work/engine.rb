module WaveWork
  class Engine < ::Rails::Engine
    isolate_namespace WaveWork
    paths['config/locales']
    config.generators do |g|
      g.template_engine :haml
    end

    config.to_prepare do
      Dir.glob(Engine.root + 'app/decorators/**/*_decorator*.rb').each do |c|
        require_dependency(c)
      end
      # ApplicationController.helper(ApplicationHelper)
    end

  end
end
