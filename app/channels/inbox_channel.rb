class InboxChannel < ApplicationCable::Channel
  def subscribed
    user = User.find(params[:user_uid])
    stream_for user
  end
end