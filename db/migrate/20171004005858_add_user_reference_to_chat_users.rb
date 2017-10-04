class AddUserReferenceToChatUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :chat_users, :user, foreign_key: true
  end
end
