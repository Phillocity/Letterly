class CreateLetters < ActiveRecord::Migration[6.1]
  def change
    create_table :letters do |t|
      t.integer :sender_id
      t.text :content
      t.integer :inbox_id
      t.time :delivery_time
      t.string :subject
      t.boolean :bottled

      t.timestamps
    end
  end
end
