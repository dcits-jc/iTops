class AddWeeklytemplateIdToWeekly < ActiveRecord::Migration[5.1]
  def change
    add_column :weeklies, :weekly_template_id, :integer
  end
end
