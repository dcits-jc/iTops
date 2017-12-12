class AddWeeklyIdToWorkflow < ActiveRecord::Migration[5.1]
  def change
    add_column :workflows, :weekly_id, :integer
  end
end
