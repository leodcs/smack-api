class User < ApplicationRecord
  self.primary_key = :uid
  has_many :chat_users, foreign_key: :user_uid
  has_many :chats, through: :chat_users
  validates_uniqueness_of :email, :username, :uid
end