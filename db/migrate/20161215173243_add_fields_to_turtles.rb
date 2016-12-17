class AddFieldsToTurtles < ActiveRecord::Migration
  def change
    add_column :turtles, :birthdate, :date
    add_column :turtles, :hobbies, :text
    add_column :turtles, :color, :string
    add_column :turtles, :dance, :text
    add_column :turtles, :music, :text
    add_column :turtles, :phrase, :text
  end
end
