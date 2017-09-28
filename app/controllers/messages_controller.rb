class MessagesController < ApplicationController

  def index
    chat = Chat.find(params[:chat_id])
    @messages = chat.messages
    render json: @messages
  end

  def create
    @message = Message.new(message_params)
    @message.chat = Chat.find(params[:chat_id])
    @message.sender = User.find(params[:user_uid])
    if @message.save
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private
  def message_params
    params.require(:message).permit(:text)
  end
end