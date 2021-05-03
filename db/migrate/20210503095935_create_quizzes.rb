class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
