class Chat < ApplicationRecord
  has_many :chat_users, dependent: :destroy
  has_many :users, through: :chat_users
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :chat_users

  def self.between_users(sender_uid, recipient_uid)
    Chat.find_by_sql("SELECT chats.* FROM chats
                      INNER JOIN chat_users ON chat_users.chat_id = chats.id
                      INNER JOIN users ON users.uid = chat_users.user_uid
                      WHERE users.uid = '#{sender_uid}'

                      INTERSECT

                      SELECT chats.* FROM chats
                      INNER JOIN chat_users ON chat_users.chat_id = chats.id
                      INNER JOIN users ON users.uid = chat_users.user_uid
                      WHERE users.uid = '#{recipient_uid}'").first
  end
end