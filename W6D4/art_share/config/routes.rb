Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:new, :edit] do
    resources :artworks, only: [:index] 
    resources :comments, only: [:index]
    resources :likes, only: [:index]
    resources :collections, only: [:index]

    
  end
  resources :artworks, except: [:new, :edit, :index] do 
    resources :comments, only: [:index]
    resources :likes, only: [:index]
  end
  resources :artworkshares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy, :index] do
    resources :likes, only: [:index]
  end
  resources :likes, only: [:create, :destroy]
  resources :collections, only: [:create, :destroy] do 
    resources :artworks, only: [:index]
  end
end

