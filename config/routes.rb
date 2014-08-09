Battlehack::Application.routes.draw do
  
  devise_for :users
resources :users
resources :raffles
root to: 'raffles#index'

end
