Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users

  resources :books, only: [:create, :index, :show, :edit, :back, :destroy]
  resources :users, only: [:create, :show, :edit, :update, :index]

  # patch 'books/:id' => 'books#update', as: 'update_book'
  get "/home/about" => "home#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
