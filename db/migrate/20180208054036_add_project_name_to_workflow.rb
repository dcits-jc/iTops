class AddProjectNameToWorkflow < ActiveRecord::Migration[5.1]
  def change
    add_column :workflows, :project_name, :string
    add_column :workflows, :project_unit, :integer
  end
end
