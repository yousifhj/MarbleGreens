class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :price
      t.string :water
      t.string :light 
      t.string :notes
      t.integer :user_id #forgin key/ a user has many plants and belongs to a user. Active record keeps track of which user the plant will belong to. 
    end 
  end
end
