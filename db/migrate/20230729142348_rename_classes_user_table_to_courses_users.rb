class RenameClassesUserTableToCoursesUsers < ActiveRecord::Migration[7.0]
  def change
    rename_table :classes_users, :courses_users
  end
end
