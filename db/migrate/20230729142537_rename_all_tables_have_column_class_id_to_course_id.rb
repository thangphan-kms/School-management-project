class RenameAllTablesHaveColumnClassIdToCourseId < ActiveRecord::Migration[7.0]
  def change
    rename_column :courses_users, :class_id, :course_id
    rename_column :schedules, :class_id, :course_id
    rename_column :users, :class_id, :course_id
  end
end
