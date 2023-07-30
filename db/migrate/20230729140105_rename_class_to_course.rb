class RenameClassToCourse < ActiveRecord::Migration[7.0]
  def change
    rename_table :classes, :courses
  end
end
