class AddingAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :description, :text
    add_column :users, :age, :integer
    add_column :users, :location, :string
    add_column :users, :name, :string
  end
end
