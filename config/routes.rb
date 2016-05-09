Rails.application.routes.draw do
   get "index" => 'sessions#index'
   get "login" => 'sessions#new'
   post "login" => 'sessions#create'
   delete 'logout' => 'sessions#destroy'

   resources :users, only: [:index]
   resources :posts, only: [:index, :new, :create]
   root 'sessions#index'
end
