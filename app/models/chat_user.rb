class ChatUser < ApplicationRecord
  belongs_to :chat
  belongs_to :user, foreign_key: :user_uid
end
