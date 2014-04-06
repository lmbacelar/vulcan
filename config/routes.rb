Vulcan::Application.routes.draw do
  namespace :its90 do
    resources :temperature_computations
    # resources :resistance_computations
  end

  namespace :iec60751 do
    resources :temperature_computations
    resources :resistance_computations
  end

  namespace :iec60584 do
    resources :temperature_computations
    resources :emf_computations
  end
end
