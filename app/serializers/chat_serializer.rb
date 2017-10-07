class ChatSerializer < ActiveModel::Serializer
  attributes  :id, :title, :lastMessage, :createdAt, :unreadMessageCount

  has_many :users, through: :chat_users

  def createdAt
    object.created_at
  end

  def title
    object.users.where.not(uid: current_user.uid).first.name
  end

  def lastMessage
    object.messages.last.try(:text).to_s
  end

  def unreadMessageCount
    object.messages.unread_by(current_user).count
  end
end