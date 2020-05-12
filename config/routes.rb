# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts

  root 'static_pages#home'

  get '/users', to: 'users/registrations#new'

  get   '/help',    to: 'static_pages#help'
  get   '/contact', to: 'static_pages#contact'
  get   '/about',   to: 'static_pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
