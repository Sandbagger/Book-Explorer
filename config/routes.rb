Rails.application.routes.draw do
  root 'books_uploads#new'
  devise_for :users
  resources :books_uploads
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
