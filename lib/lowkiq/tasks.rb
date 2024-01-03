namespace :lowkiq do
  task :setup

  task :work => :preload do
    require 'lowkiq'

    worker = Lowkiq::Worker.new
    worker.work(ENV['INTERVAL'] || 5)
  end

  task :preload => :setup do
    if defined?(Rails) && Rails.respond_to?(:application)
      if Rails.application.config.eager_load
        ActiveSupport.run_load_hooks(:before_eager_load, Rails.application)
        Rails.application.config.eager_load_namespaces.each(&:eager_load!)
      end
    end
  end
end
