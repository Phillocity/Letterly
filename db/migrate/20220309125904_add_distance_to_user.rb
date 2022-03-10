class AddDistanceToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :letter_distance_from, :integer
  end
end
