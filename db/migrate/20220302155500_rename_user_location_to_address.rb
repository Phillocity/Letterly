class RenameUserLocationToAddress < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :location, :address
  end
end
