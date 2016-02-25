class AddTurtleIdToConnections < ActiveRecord::Migration
  def change
    add_column :connections, :turtle_id, :integer
  end
end
