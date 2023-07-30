class AddForeignKeysToClasesUsers < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :classes_users, :classes, column: :class_id, primary_key: 'id'
    add_foreign_key :classes_users, :users, column: :user_id, primary_key: 'id'
  end
end
