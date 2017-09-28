class ChatsController < ApplicationController
  before_action :set_chat, only: [:update, :destroy]

  def index
    @chats = Chat.joins(:chat_users, :messages).
        where(chat_users: { user_uid: params[:user_uid] }).
        order("messages.created_at DESC")
        .uniq
    render json: @chats, sender_uid: params[:user_uid]
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      render json: @chat,
             sender_uid: @chat.chat_users.first.user_uid,
             status: :created,
             location: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  def show
    users = ChatUser.where(user_uid: [params[:sender_uid], params[:recipient_uid]])
    @chat = Chat.between_users(users)
    render json: @chat, sender_uid: params[:sender_uid]
  end

  def update
    if @chat.update(chat_params)
      render json: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @chat.destroy
  end

  private
  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(chat_users_attributes: [:user_uid])
  end
end
