Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do
      resources :chirps, only: [:index, :create]
      resources :users, only: [:index, :show] do
        post :add_to_upvotes, on: :member 
        post :remove_from_upvotes, on: :member
      end
    end
  end
end
