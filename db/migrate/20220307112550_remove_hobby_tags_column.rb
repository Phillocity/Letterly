class RemoveHobbyTagsColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :hobby_tags, :user_id, :integer
    remove_column :hobby_tags, :hobby_id, :integer
  end
end
