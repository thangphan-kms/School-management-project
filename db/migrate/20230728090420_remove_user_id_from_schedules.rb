class RemoveUserIdFromSchedules < ActiveRecord::Migration[7.0]
  def change
    remove_column :schedules, :user_id
  end
end
