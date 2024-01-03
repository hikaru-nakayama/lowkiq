namespace :lowkiq do
  task :work do
    require 'lowkiq'

    worker = Lowkiq::Worker.new
    worker.work(ENV['INTERVAL'] || 5)
  end
end
