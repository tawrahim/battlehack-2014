Battlehack::Application.routes.draw do
  
resources :users
resources :raffles
root to: 'raffles#index'

end
