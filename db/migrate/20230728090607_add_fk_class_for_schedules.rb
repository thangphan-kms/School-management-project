class AddFkClassForSchedules < ActiveRecord::Migration[7.0]
  def change
    add_reference :schedules, :class, null: false, foreign_key: true
  end
end
