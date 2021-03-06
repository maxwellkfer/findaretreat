Rails.application.routes.draw do
  devise_for :users, path: "accounts"
  root to: 'pages#home'
  get "users/dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :venues do
    resources :bookings do
      resources :reviews, only: :create
    end
  end
end
