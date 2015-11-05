class CreateFoodFacilities < ActiveRecord::Migration
  def change
    create_table :food_facilities do |t|

      t.timestamps null: false
    end
  end
end
