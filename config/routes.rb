Rails.application.routes.draw do
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "products#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      #resources :structures
      resources :sessions, only: [:create, :destroy]
    end
  end

end
