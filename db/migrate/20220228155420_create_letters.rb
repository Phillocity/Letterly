class CreateLetters < ActiveRecord::Migration[6.1]
  def change
    create_table :letters do |t|
      t.references :sender
      t.references :receiver
      t.references :inbox
      t.text :content
      t.time :delivery_time
      t.string :subject
      t.boolean :bottled

      t.timestamps
    end
    add_foreign_key :letters, :users, column: :sender_id, primary_key: :id
    add_foreign_key :letters, :users, column: :receiver_id, primary_key: :id
  end
end
