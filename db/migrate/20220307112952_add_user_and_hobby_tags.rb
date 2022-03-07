class AddUserAndHobbyTags < ActiveRecord::Migration[6.1]
  def change
    add_reference :hobby_tags, :user, foreign_key: true
    add_reference :hobby_tags, :hobby, foreign_key: true
  end
end
