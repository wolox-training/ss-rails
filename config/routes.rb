require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: 'auth'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :open_library, only: :show, param: :isbn
      resources :books, only: [:index, :show]
      resources :book_suggestions, only: [:create]
      resources :users do
        resources :rents, only: [:create, :index]
      end
      get 'rents/book_rankings', to: 'rents#book_rankings'
      get 'rents/active', to: 'rents#active'
    end
  end
end
