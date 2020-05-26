Rails.application.routes.draw do
  resources :productions, only: [:index, :new, :create, :show]
  root 'productions#index'
end
