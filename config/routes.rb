Rails.application.routes.draw do
  resources :questions
 
get "questions/:id" => "posts#show"
get "questions" => "questions#index"
  devise_for :users
    root 'main#index'
end
