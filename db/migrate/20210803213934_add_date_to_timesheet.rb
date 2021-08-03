class AddDateToTimesheet < ActiveRecord::Migration[6.1]
  def change
    add_column :timesheets, :date, :datetime
  end
end
