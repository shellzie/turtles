class RemoveUserIdFromNetworks < ActiveRecord::Migration
  def change
    remove_column :networks, :user_id, :integer
  end
end
