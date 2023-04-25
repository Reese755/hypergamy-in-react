class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :rating_for_user
      t.float :value
      t.integer :user_id
      t.timestamps
    end
  end
end