class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :text

      t.timestamps
    end
  end
end
