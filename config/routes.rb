Rails.application.routes.draw do

  resources :players
  resources :games do
    resources :attendances
  end
  root 'staticpages#index'

end
