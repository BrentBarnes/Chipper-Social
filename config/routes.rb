Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  
  
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:show, :index, :edit]
  resources :invitations, only: [:show, :index, :create, :update, :destroy]
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  root "posts#index"
end
