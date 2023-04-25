class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :profile_picture
      t.string :name
      t.string :location
      t.integer :age
      t.string :height
      t.string :weight
      t.string :gender

      t.timestamps
    end
  end
end
