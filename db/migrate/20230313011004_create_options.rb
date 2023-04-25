class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.integer :question_id
      t.string :text

      t.timestamps
    end
  end
end
