class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :calories
      t.integer :carbohydrates
      t.integer :protein
      t.integer :fat
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
