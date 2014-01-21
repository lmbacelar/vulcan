Vulcan::Application.routes.draw do
  namespace :iec60751 do
    resource :temperature_computation, only: :create
  end
end
