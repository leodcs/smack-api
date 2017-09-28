class CreateChatUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_users do |t|
      t.string :user_uid, null: false
      t.references :chat, foreign_key: true

      t.timestamps
    end
  end
end
