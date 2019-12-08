class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :price
      t.string :water
      t.string :light 
      t.string :notes
      t.integer :user_id
    end 
  end
end
