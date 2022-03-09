class AddBottledToInboxes < ActiveRecord::Migration[6.1]
  def change
    add_column :inboxes, :bottled, :boolean
  end
end
