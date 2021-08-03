class AddDefaultValueToClockOut < ActiveRecord::Migration[6.1]
  def up
    change_column_default :timesheets, :clock_out, nil
  end

  def down
  end
end
