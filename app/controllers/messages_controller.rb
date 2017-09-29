class MessagesController < ApplicationController

  def index
    chat = Chat.find(params[:chat_id])
    @messages = chat.messages
    render_api(@messages)
  end

  def create
    @message = Message.new(message_params)
    @message.chat = Chat.find(params[:chat_id])
    @message.sender = User.find(params[:user_uid])
    @message.save
    render_api(@message)
  end

  private
  def message_params
    params.require(:message).permit(:text)
  end
end