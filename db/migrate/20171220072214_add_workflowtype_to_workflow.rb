class AddWorkflowtypeToWorkflow < ActiveRecord::Migration[5.1]
  def change
    add_column :workflows, :workflow_type_id, :integer
  end
end
