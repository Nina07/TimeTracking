class RemoveColumnFromUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :email_id
  end

  def down
    add_column :users, :email_id
  end
end
