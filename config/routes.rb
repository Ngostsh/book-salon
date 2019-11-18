Rails.application.routes.draw do
  root  'reviews#index'
    get 'reviews' => 'reviews#index'
    get 'reviews/new'  =>  'reviews#new'
    post  'reviews'      =>  'reviews#create'
    get 'reviews/:id' => 'reviews#show' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
