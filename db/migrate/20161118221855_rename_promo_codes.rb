class RenamePromoCodes < ActiveRecord::Migration
  def change
    rename_table :promo_codes, :promos
  end
end
