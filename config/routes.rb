Rails.application.routes.draw do
  # resources :books
  # root "books#index"
 require 'sidekiq/web'
 mount Sidekiq::Web => '/sidekiq'
  root 'projects#index'
  post "hello", to: 'projects#hello'
  resources :projects do
    collection do
      get 'search'
    end

  end
  # patch 'assign_developer', to: 'bugs#assign_developer'
  resources :bugs do
   member do
      patch :assign_developer
    end
  end

devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions',
  passwords: 'users/passwords',
  confirmations: 'users/confirmations',
  unlocks: 'users/unlocks'
}


end
