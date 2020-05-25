Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :sessions => "users/sessions",
  }

  devise_scope :users do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  get 'welcome', to: 'welcome#index'

  resources :articles

  resources :users, only: [:index, :show] do
    resources :articles do
    end
  end


  authenticated :user do
    root :to => 'articles#index', :as => "user_authenticated_root"
  end
  root to: 'welcome#index'
  
end
