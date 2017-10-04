class ChatSerializer < ActiveModel::Serializer
  attributes  :id, :title, :lastMessage, :createdAt

  has_many :users, through: :chat_users

  def createdAt
    object.created_at
  end

  def title
    # current_user = User.find(@instance_options[:sender_uid])
    object.users.where.not(uid: current_user.uid).first.name
  end

  def lastMessage
    object.messages.last.try(:text).to_s
  end
end