class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :price
      t.string :water
      t.string :light 
      t.integer :greenhouse_id #forign_key, plant belongs to greenhouse 
    end 
  end
end
