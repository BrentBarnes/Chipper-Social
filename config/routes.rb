Rails.application.routes.draw do
  
  
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:show, :index, :edit]
  resources :invitations, only: [:show, :index, :create, :update, :destroy]
  resources :posts, only: [:index, :new, :create, :destroy]

  root "posts#index"
end
