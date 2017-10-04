Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  mount_devise_token_auth_for 'User', at: 'auth', controllers: { registrations: 'api/registrations' }

  namespace :api do
    get "chats/:recipient_id" => "chats#show"

    resources :users, only: [:index, :show]
    resources :chats, except: [:show] do
      resources :messages, only: [:index, :create]
    end
  end
end