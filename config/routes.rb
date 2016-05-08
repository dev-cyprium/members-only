Rails.application.routes.draw do
   get "index" => 'sessions#index'

   root 'sessions#index'
end
