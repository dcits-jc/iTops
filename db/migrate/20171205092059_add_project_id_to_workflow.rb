class AddProjectIdToWorkflow < ActiveRecord::Migration[5.1]
  def change
    add_column :workflows, :project_id, :integer
  end
end
