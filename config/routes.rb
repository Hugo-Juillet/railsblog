Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      # User-Registrierung
      resources :users, only: [:create, :show]
      resources :posts, only: [:index, :create, :show, :update, :destroy]
      resources :comments, only: [:index, :create, :show, :update, :destroy]
      # Authentication
      post 'auth/login', to: 'auth#login'
      # Andere Routen...
    end
  end
end