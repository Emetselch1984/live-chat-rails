Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth',controllers: {
      registrations: 'auth/registrations'
  }
  resources :messages, only: [:index,:show] do
    member do
      resources :likes, only: [:create]
    end
  end
  resources :likes, only: [:destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end