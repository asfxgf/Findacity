Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  root to: 'travel#index'
  get '/search' => 'travel#search'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
