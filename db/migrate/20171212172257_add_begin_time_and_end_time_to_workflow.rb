class AddBeginTimeAndEndTimeToWorkflow < ActiveRecord::Migration[5.1]
  def change
    add_column :workflows, :start_time, :datetime
    add_column :workflows, :end_time, :datetime
  end
end
