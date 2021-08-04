class AddRoleToUser < ActiveRecord::Migration[6.1]
  def up
    add_reference :users, :role, null: false
  end

  def down
    remove_reference :users, :role, null: false
  end
end
