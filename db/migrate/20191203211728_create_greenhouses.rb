class CreateGreenhouses < ActiveRecord::Migration
  def change
    create_table :greenhouses do |t|
      t.string :name 
    end 
  end
end
