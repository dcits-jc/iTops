class AddStartTimeAndEndTimeToWeekly < ActiveRecord::Migration[5.1]
  def change
    add_column :weeklies, :start_time, :datetime
    add_column :weeklies, :end_time, :datetime
  end
end
