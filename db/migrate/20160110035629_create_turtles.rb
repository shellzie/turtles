class CreateTurtles < ActiveRecord::Migration
  def change
    create_table :turtles do |t|
      t.string :name
      t.text :bio
      t.string :code
      t.datetime :last_connect_time
      t.string :image_path
      t.integer  :user_id

      t.timestamps null: false
    end

    add_foreign_key :turtles, :users

  end
end
