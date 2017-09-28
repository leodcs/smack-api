class Chat < ApplicationRecord
  has_many :chat_users, dependent: :destroy
  has_many :users, through: :chat_users
  has_many :messages
  accepts_nested_attributes_for :chat_users

  def self.between_users(chat_users)
    if chat_users.first.present? and chat_users.second.present?
      first_user_chats = Chat.joins(:chat_users).where(chat_users: { user_uid: chat_users.first.user_uid })
      second_user_chats = Chat.joins(:chat_users).where(chat_users: { user_uid: chat_users.second.user_uid })
      return (first_user_chats & second_user_chats).last # Returns Intersection between those two arrays
    end
  end
end