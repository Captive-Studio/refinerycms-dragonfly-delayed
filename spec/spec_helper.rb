require 'active_record'
require 'shoulda/matchers'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
load File.dirname(__FILE__) + '/schema.rb'

require 'refinerycms-dragonfly-delayed'