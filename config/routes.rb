Rails.application.routes.draw do
  root 'disciplines#index'
  resources :disciplines, only: :index
end
