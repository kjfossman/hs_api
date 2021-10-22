class AddWorkoutToRoutines < ActiveRecord::Migration[6.1]
  def change
    add_reference :routines, :workout, null: false, foreign_key: true
  end
end
