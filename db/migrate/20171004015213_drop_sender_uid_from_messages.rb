class DropSenderUidFromMessages < ActiveRecord::Migration[5.1]
  def change
    remove_column :messages, :sender_uid
  end
end
