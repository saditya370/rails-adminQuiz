class CreateMcqs < ActiveRecord::Migration[7.0]
  def change
    create_table :mcqs do |t|
      t.string :quesname
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :answer
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
