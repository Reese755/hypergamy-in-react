class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.integer :rating_id
      t.string :age_range
      t.string :gender
      t.string :location

      t.timestamps
    end
  end
end
