class RemovePasswordFromNetworks < ActiveRecord::Migration
  def change
    remove_column :networks, :password, :string
  end
end
