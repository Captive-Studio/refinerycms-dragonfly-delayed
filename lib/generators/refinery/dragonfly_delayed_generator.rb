module Refinery
  class DragonflyDelayedGenerator < Rails::Generators::Base
    
    def rake_db
      rake "refinery_dragonfly_delayed:install:migrations"
    end
    
  end
end