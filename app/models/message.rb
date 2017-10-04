class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :sender, foreign_key: :user_id, class_name: 'User'
  after_create_commit { ChatBroadcastJob.perform_later(self) }
end
