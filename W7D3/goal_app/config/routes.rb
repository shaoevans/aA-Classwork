Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do 
    resources :objectives, only: [:show, :new, :destroy, :create]
  end
  resource :session
end
