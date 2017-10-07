class Api::ChatsController < Api::ApiBaseController
  before_action :set_chat, only: [:update, :destroy]

  def index
    @chats = current_user.chats
                 .joins("LEFT OUTER JOIN messages ON messages.chat_id = chats.id")
                 .order(updated_at: :desc)
                 .order('messages.created_at DESC')
                 .uniq
    render_api(@chats)
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.save
    render_api(@chat)
  end

  def show
    @chat = Chat.between_users(current_user.id, params[:recipient_id])
    render_api(@chat)
  end

  def update
    @chat.update(chat_params)
    render_api(@chat)
  end

  def destroy
    @chat.destroy
    render_api(@chat)
  end

  private
  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(chat_users_attributes: [:user_id])
  end
end
