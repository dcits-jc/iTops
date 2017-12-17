class CreateWeeklyTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :weekly_templates do |t|
      t.integer "year"
      t.integer "month"
      t.integer "week"
      t.datetime "start_time"
      t.datetime "end_time"      
      t.timestamps
    end
  end
end
