Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  resources :books, only: [:create, :index, :show, :edit, :back, :destroy]
  resources :users, only: [:create, :show, :edit, :update, :index]
  
  patch 'books/:id' => 'books#update', as: 'update_book'
  get "/homes/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
