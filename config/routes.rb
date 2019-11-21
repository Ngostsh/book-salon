Rails.application.routes.draw do
  devise_for :users
  root  'reviews#index'
    get 'reviews' => 'reviews#index'
    get 'reviews/new'  =>  'reviews#new'
    post  'reviews'      =>  'reviews#create'
    get 'reviews/:id' => 'reviews#show'
    delete 'reviews/:id' => 'reviews#destroy'
    get 'reviews/edit/:id' => 'reviews#edit'
    patch 'reviews/:id' => 'reviews#update'
    get 'users/:id' => 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
