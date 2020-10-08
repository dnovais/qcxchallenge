Rails.application.routes.draw do
  root 'disciplines#index'
  resources :questions, only: :index
  resources :disciplines, only: :index
end
