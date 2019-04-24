Rails.application.routes.draw do

  resources :players, except: [:show]
  resources :games do
    resources :attendances, except: [:index, :show]
  end
  resources :games_past, only: [:index]
  root 'staticpages#index'
end
