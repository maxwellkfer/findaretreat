Rails.application.routes.draw do
  devise_for :users, path: "accounts"

  root to: 'pages#home'
  get "dashboard", to: "pages#dashboard", as: "dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :venues, only: [:index, :show]

  resources :users, except: [:index] do
    resources :venues, only: [:delete, :new, :create, :edit, :update]
    resources :bookings
  end
end
