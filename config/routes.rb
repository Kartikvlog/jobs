require 'sidekiq'
require 'sidekiq/web'

Rails.application.routes.draw do
  resources :users
  resources :contacts, only: [:index, :create]
  mount Sidekiq::Web => '/sidekiq'
end
