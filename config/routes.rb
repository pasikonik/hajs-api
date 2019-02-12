Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'token', to: 'authentication#token'
      resources :users
      resources :places
      resources :bills
      resources :payments do
        collection do
          post 'create_rent'
        end
      end
    end
  end
end
