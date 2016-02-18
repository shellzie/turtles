class AddTurtleIdToNetworks < ActiveRecord::Migration
  def change
    add_column :networks, :turtle_id, :integer
  end
end
