Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'token', to: 'authentication#token'
      resources :users
      resources :places
    end
  end
end
