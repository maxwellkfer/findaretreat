Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :venues, only: [:index, :show]

  resources :users do
    resources :venues, only: [:delete, :new, :edit, :create, :update]
    resources :bookings, only: [:create, :destroy]
  end
end
