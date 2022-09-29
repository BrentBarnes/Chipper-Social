Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  
  
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:show, :index, :edit, :update] do
    resources :likes, only: [:index]
  end

  resources :invitations, only: [:show, :index, :create, :update, :destroy]

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :comments do
    resources :likes, only: [:create, :destroy]
  end

  root "users/sessions#new"
  get "/static_pages/:id", to: "static_pages#user_posts", as: 'user_posts'
  get "/static_pages", to: "static_pages#about", as: 'about'
end
