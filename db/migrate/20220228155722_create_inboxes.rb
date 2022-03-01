class CreateInboxes < ActiveRecord::Migration[6.1]
  def change
    create_table :inboxes do |t|
      t.references :first_user, null: false, foreign_key: {to_table: :users}
      t.references :second_user, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
