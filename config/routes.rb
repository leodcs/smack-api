Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :users, param: :uid, only: [:index, :create, :show]
  resources :chats, except: [:index, :show]
  get "chats/:sender_uid/:recipient_uid" => "chats#show"
  get ":user_uid/chats" => "chats#index"
  get ":chat_id/messages" => "messages#index"
  post ":chat_id/:user_uid/messages" => "messages#create"
end