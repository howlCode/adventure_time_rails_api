Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'refresh', controller: :refresh, action: :create
      post 'signin', controller: :signin, action: :create
      post 'signup', controller: :signup, action: :create
      delete 'signin', controller: :signin, action: :destroy
      get 'me', controller: :users, action: :me
      namespace :admin do
        resources :users, only: [:index]
        resources :stories, only: [:index]
      end
      resources :stories do
        resources :arcs do
          resources :votes, only: [:create]
        end
      end

    end
  end
  
end
