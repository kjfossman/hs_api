class RemoveUsernameFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :username, :string
    remove_column :users, :display_name, :string
  end
end
