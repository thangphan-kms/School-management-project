class RemoveColumnCourseIdFromUsersTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :course_id
  end
end
