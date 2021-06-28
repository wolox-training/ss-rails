Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :open_library, only: :show, param: :isbn
      resources :books, only: [:index, :show]
      resources :book_suggestions, only: [:create]
    end
  end
end
