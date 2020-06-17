Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'tags/index'
  get 'tags/show'
  get 'categories/index'
  get 'categories/show'
  get 'comments/create'
  get 'comments/destroy'
  devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'signup'},
  :controllers => {
    :registrations => "users/registrations",
    :sessions => "users/sessions",
  }


  get 'welcome', to: 'welcome#index'

  resources :articles do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy] 
  end

  resources :users, only: [:index, :show, :edit] do
    resources :articles
    resources :favorites, only: :index
  end


  resources :tags, only: [:index, :show] 
  get 'home', to: 'articles#index'

  authenticated :user do
    root :to => 'articles#index', :as => "user_authenticated_root"
  end
  root 'welcome#index'
end
