class CreateTimesheets < ActiveRecord::Migration[6.1]
  def change
    create_table :timesheets do |t|
      t.datetime :clock_in
      t.datetime :clock_out
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
