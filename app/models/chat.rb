class Chat < ApplicationRecord
  has_many :chat_users, dependent: :destroy
  has_many :users, through: :chat_users
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :chat_users

  def self.between_users(current_user_id, recipient_user_id)
    Chat.find_by_sql("SELECT chats.* FROM chats
                      INNER JOIN chat_users ON chat_users.chat_id = chats.id
                      INNER JOIN users ON users.id = chat_users.user_id
                      WHERE users.id = #{current_user_id}

                      INTERSECT

                      SELECT chats.* FROM chats
                      INNER JOIN chat_users ON chat_users.chat_id = chats.id
                      INNER JOIN users ON users.id = chat_users.user_id
                      WHERE users.id = #{recipient_user_id}").first
  end

  def mark_messages_as_read_by(current_user)
    messages.unread_by(current_user).update_all(read: true)
  end
end