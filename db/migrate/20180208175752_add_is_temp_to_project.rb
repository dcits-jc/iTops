class AddIsTempToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :is_temp, :boolean,default: false
  end
end
