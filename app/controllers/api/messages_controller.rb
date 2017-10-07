class Api::MessagesController < Api::ApiBaseController
  before_action :set_chat

  def index
    @messages = @chat.messages.order(:created_at)
    @chat.mark_messages_as_read_by(current_user)
    render_api(@messages)
  end

  def create
    @message = @chat.messages.build(message_params)
    @message_sender = MessageSender.new(@message, current_user)
    @message_sender.perform
    render_api(@message)
  end

  def update
    @message = @chat.messages.find(params[:id])
    @message.update(message_params)
    render_api(@message)
  end

  private
  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:text, :read)
  end
end