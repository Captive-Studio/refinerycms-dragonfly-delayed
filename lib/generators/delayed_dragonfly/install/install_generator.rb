require 'rails/generators/active_record'


module DelayedDragonfly
  class InstallGenerator < ActiveRecord::Generators::Base
    desc "Installs Delayed Dragonfly and generates the necessary migrations"
    argument :name, type: :string, default: "Thumb"
    source_root File.expand_path("../templates", __FILE__)
    

    def create_migrations
      migration_template 'migrations/create_thumbs.rb', 'db/migrate/create_thumbs.rb'
    end
  end
end