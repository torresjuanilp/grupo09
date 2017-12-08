Rails.application.routes.draw do
  get 'faculties/new' => 'faculties#new'
  
  get'faculties/show_users' => 'faculties#show_users'

  get 'faculties/create' 

  get 'faculties/edit'

  get 'faculties/update'

  get 'faculties/destroy'

  get 'faculties/show' => 'faculties#show'

  get 'faculties' => 'faculties#index'

  get 'permits/create'

  get 'permits/show'

  get 'permits/index'
get "permits/:id/edit" => "permits#edit"
put "permits/:id" => "permits#update"
  resources :questions
  resources :categories
  resources :faculties
  devise_for :users
	get '/users/questions' => 'users#questions'
  get '/users/answers' => 'users#answers'
    get '/users/mispermisos' => 'users#mispermisos'

  resources :users
get "questions/:id" => "questions#show"
get "questions" => "questions#index"
get "questions/voteposi" => "questions#voteposi" 
get "categories" => "categories#index"
get "categories/new" => "categories#new"
get "categories/show0" => "categories#show"
    root 'main#index'
	get 'comments/index' 
  post 'comments/new' => 'comments#new'
  post 'comments/responder' => 'comments#responder'
post 'comments/delete' => 'comments#delete'
 

  post 'answers/responder' => 'comments#responder'
get 'answers/index' 
 post 'answers/new' => 'answers#new'
 post 'answers/delete' => 'answers#delete'
 post 'answers/elegirmejor' => 'answers#elegirmejor'
	post 'answers/show' => 'answers#show'

  get '/users/show' => 'users#show'



end
