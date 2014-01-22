Vulcan::Application.routes.draw do
  namespace :iec60751 do
    resources :temperature_computations
  end
end
