class AddIndexUniqueForSchedules < ActiveRecord::Migration[7.0]
  def change
    add_index :schedules, [:subject_id, :class_id], unique: true
  end
end
