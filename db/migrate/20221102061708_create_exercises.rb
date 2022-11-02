class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
