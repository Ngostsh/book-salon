Rails.application.routes.draw do
  devise_for :users
  root  'books#index'
    get 'books' => 'books#index'
    get 'books/new'  =>  'books#new'
    post  'books'      =>  'books#create'
    get 'books/search' => 'books#search'
    get 'books/:id' => 'books#show'
    delete 'books/:id' => 'books#destroy'
    get 'books/edit/:id' => 'books#edit'
    patch 'books/:id' => 'books#update'
    get 'users/:id' => 'users#show'
    get 'users/:id/reviews' => 'users#show_reviews'
  resources :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
