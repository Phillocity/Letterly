class CreateHobbyTags < ActiveRecord::Migration[6.1]
  def change
    create_table :hobby_tags do |t|
      t.integer :hobby_id
      t.integer :user_id

      t.timestamps
    end
  end
end
