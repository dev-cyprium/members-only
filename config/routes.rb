Rails.application.routes.draw do
   get "index" => 'sessions#index'
   get "login" => 'sessions#new'

   resources :users
   root 'sessions#index'
end
