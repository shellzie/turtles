class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :ip_address
      t.text :turtle_name

      t.timestamps null: false
    end
  end
end
