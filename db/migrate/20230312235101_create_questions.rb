class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.integer :survey_id
      t.string :text

      t.timestamps
    end
  end
end
