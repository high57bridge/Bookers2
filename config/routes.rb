Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  get 'books/new'
  get 'books/index'
  get 'books/show'
  
  get 'users/show'
  get 'users/edit'

  get "/homes/about" => "homes#about", as: "about"

  resources :books, only: [:new, :create, :index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
