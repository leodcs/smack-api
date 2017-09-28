class User < ApplicationRecord
  self.primary_key = :uid
  has_many :chat_users
  has_many :chats, through: :chat_users
  validates_uniqueness_of :email, :username, :uid
end