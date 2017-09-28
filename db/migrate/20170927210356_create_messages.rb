class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :chat, foreign_key: true
      t.string :sender_uid, null: false
      t.string :text

      t.timestamps
    end
  end
end
