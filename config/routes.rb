Rails.application.routes.draw do
  root 'articles#index'
  get 'articles/index'
  get 'articles/show'
  get 'articles/edit'
  get 'articles/new'
  get 'articles/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
