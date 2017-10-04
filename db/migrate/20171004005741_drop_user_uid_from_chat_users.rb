class DropUserUidFromChatUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :chat_users, :user_uid
  end
end
