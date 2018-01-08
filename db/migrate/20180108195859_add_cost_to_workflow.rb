class AddCostToWorkflow < ActiveRecord::Migration[5.1]
  def change
    add_column :workflows, :cost, :float
  end
end
