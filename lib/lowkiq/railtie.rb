module Lowkiq
    class Railtie < Rails::Railtie
        rake_tasks do
        require 'lowkiq/tasks'

        task "lowkiq:setup" => :environment
        end
    end
end