Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'lists#index'
  resources :lists, only: %i[index show new create edit update] do
    resources :bookmarks, only: %i[new create edit update]
    resources :reviews, only: %i[new create]
  end

  resources :bookmarks, only: [:destroy]
end
