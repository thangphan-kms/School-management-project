class CreateUserJwtDenylist < ActiveRecord::Migration[7.0]
  def change
    create_table :user_jwt_denylist do |t|
      t.string :jti
      t.datetime :exp

      t.timestamps
    end
    add_index :user_jwt_denylist, :jti
  end
end
