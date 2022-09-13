Rails.application.routes.draw do
  root "posts#index"
  
  resources :users, only: [:show, :index, :edit]
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :invitations, only: [:index, :create, :update, :delete]
end
