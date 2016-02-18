class AddEncryptedPasswordToNetworks < ActiveRecord::Migration
  def change
    add_column :networks, :encrypted_password, :string
  end
end
