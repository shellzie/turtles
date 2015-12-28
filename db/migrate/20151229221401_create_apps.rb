class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name, :limit => 255
      t.text :description
      t.string :image_path, :limit => 255

      t.timestamps null:false
    end
  end
end
