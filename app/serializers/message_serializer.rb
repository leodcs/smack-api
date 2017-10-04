class MessageSerializer < ActiveModel::Serializer
  attributes :userId, :text, :createdAt

  def createdAt
    object.created_at
  end

  def userId
    object.user_id
  end
end