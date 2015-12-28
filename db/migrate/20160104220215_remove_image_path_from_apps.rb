class RemoveImagePathFromApps < ActiveRecord::Migration
  def change
    remove_column :apps, :image_path, :string
  end

end
