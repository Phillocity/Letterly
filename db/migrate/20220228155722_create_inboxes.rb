class CreateInboxes < ActiveRecord::Migration[6.1]
  def change
    create_table :inboxes do |t|
      # t.references :first_user, null: false, foreign_key: {to_table: :users}
      # t.references :second_user, null: false, foreign_key: {to_table: :users}
      t.references :first_user
      t.references :second_user
      t.timestamps
    end

    add_foreign_key :inboxes, :users, column: :first_user_id, primary_key: :id
    add_foreign_key :inboxes, :users, column: :second_user_id, primary_key: :id

  end
end
