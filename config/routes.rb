Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  constraints ->  request { request.session[:user_id].present? } do
    # ログインしてる時のパス
    root 'work_outs#index'
  end
  # ログインしてない時のパス
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :training_menus,      only: [:index, :create, :destroy]
  resources :training_types,      only: [:index, :create, :destroy]
  resources :body_parts,          only: [:index, :create, :destroy]
  resources :work_outs
end
