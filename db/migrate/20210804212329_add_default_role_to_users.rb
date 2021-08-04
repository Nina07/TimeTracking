class AddDefaultRoleToUsers < ActiveRecord::Migration[6.1]
  def up
    change_column_default :users, :role_id, 2
  end
end
