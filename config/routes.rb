Rails.application.routes.draw do
   get "index" => 'sessions#index'
   get "login" => 'sessions#new'
   post "login" => 'sessions#create'

   resources :users, only: [:index]
   root 'sessions#index'
end
