class AddDisableWorkflowToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :disable_workflow, :boolean,default: false
  end
end
