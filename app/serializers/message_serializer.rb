class MessageSerializer < ActiveModel::Serializer
  attributes :userId, :text, :createdAt, :chatId

  def createdAt
    object.created_at
  end

  def userId
    object.sender_uid
  end

  def chatId
    object.chat_id
  end
end