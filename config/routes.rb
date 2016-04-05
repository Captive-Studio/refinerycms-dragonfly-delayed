Refinery::Core::Engine.routes.append do

  namespace :dragonfly_delayed do
    resources :thumbnail_geometries, path: '', only: :show
  end
  
end