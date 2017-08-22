Rails.application.routes.draw do
  root 'application#index'
  resources :users, exclude: [:index]

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'shoes' => 'shoes#index'
  post 'shoes' => 'shoes#create'
  put 'shoes/:id' => 'shoes#buy'
  delete 'shoes/:id' => 'shoes#destroy'
end
