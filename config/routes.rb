Rails.application.routes.draw do
  resources :questions
  resources :categories
 
get "questions/:id" => "posts#show"
get "questions" => "questions#index"
get "categories" => "categories#index"
get "categories/new" => "categories#new"
get "categories/show0" => "categories#show"
  devise_for :users
    root 'main#index'
end
