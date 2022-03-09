class AddDistanceToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :distance_from, :integer
  end
end
