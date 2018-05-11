Refinery::Core::Engine.routes.draw do

  namespace :dragonfly_delayed do
    resources :thumbnail_geometries, path: '', only: :show
  end
  
end