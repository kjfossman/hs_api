class CreateRoutines < ActiveRecord::Migration[6.1]
  def change
    create_table :routines do |t|
      t.integer :sets
      t.string :reps
      t.string :notes

      t.timestamps
    end
  end
end
