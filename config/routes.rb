Rails.application.routes.draw do
  root 'projects#index'

  resources :projects

  resources :bugs


devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions',
  passwords: 'users/passwords',
  confirmations: 'users/confirmations',
  unlocks: 'users/unlocks'
}


end
