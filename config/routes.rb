Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :cars do
    resources :reservations, only: [:new, :create]
    collection do
      get :my_cars
    end
  end
  resources :reservations, only: [:destroy, :index]
end
