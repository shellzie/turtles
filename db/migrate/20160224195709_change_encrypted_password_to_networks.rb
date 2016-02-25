class ChangeEncryptedPasswordToNetworks < ActiveRecord::Migration
  def change
    rename_column :networks, :encrypted_password, :password
  end
end
