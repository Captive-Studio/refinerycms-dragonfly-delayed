module Refinery
  module DragonflyDelayed
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::DragonflyDelayed
      
      engine_name :refinery_dragonfly_delayed
    end
  end
end
