Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create destroy]
  resources :events, except: %i[edit update destroy]
  root to: 'sessions#new'
end
