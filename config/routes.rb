Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index], path: :pals, as: :pals do
    resources :inboxes, only: [:index, :show]
  end

  resources :inboxes, only: [:new, :create] do
    resources :letters, only: [:new, :create]
  end

  resources :letter, only: [:index, :show]
end
