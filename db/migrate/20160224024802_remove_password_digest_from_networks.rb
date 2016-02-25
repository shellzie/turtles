class RemovePasswordDigestFromNetworks < ActiveRecord::Migration
  def change
    remove_column :networks, :password_digest, :string
  end
end
