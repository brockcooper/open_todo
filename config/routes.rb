Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show], :as => :user do
    resources :lists, only: [:new, :create, :show] do
      resources :todos, only: [:create, :destroy] 
    end
  end
  get 'welcome/index'
  get 'welcome/about'

  resources :todos, only: [:create, :destroy]
  resources :lists, only: [:create]

  root to: 'welcome#index'
end
