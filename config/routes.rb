Rails.application.routes.draw do

  resources :players, except: [:show]
  resources :games do
    resources :attendances, except: [:index, :show]
  end
  root 'staticpages#index'

end
