class AddArrivalTimeToLetters < ActiveRecord::Migration[6.1]
  def change
    add_column :letters, :arrival_time, :datetime
  end
end
