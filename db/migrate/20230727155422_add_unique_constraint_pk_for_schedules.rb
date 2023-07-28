class AddUniqueConstraintPkForSchedules < ActiveRecord::Migration[7.0]
  def change
    add_index :schedules, [:user_id, :subject_id], unique: true
  end
end
