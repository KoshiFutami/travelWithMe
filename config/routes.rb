Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  get 'comments/create'
  get 'comments/destroy'
  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :sessions => "users/sessions",
  }

  devise_scope :users do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  get 'welcome', to: 'welcome#index'

  resources :articles do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show] do
    resources :articles do
    end
  end

  resources :categories, only: [:index, :show] do
  end

  authenticated :user do
    root :to => 'articles#index', :as => "user_authenticated_root"
  end
  root to: 'welcome#index'
  
end
