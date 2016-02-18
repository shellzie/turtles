class AddPasswordDigestToNetworks < ActiveRecord::Migration
  def change
    add_column :networks, :password_digest, :string
  end
end
