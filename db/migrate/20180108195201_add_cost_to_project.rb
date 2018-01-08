class AddCostToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :cost_plan, :integer
    add_column :projects, :cost_already, :integer
  end
end
