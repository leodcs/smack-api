class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :chat_users
  has_many :chats, through: :chat_users
  validates_uniqueness_of :email, :username

  scope :all_except, ->(user) { where.not(id: user) }
end