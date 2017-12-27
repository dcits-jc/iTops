class AddWorktypeToWorkflow < ActiveRecord::Migration[5.1]
  def change
    add_column :workflows, :remaining_issue, :text
  end
end
