class CreateJoinTableClassesStudents < ActiveRecord::Migration[7.0]
  def change
    create_join_table :classes, :users do |t|
      t.index [:class_id, :user_id], unique: true
      t.float :gpa, null: true
    end
  end
end
