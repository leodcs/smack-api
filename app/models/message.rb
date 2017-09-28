class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :sender, foreign_key: :sender_uid, class_name: 'User'
end
