class AddUserIdToWorkflow < ActiveRecord::Migration[5.1]
  def change
    add_column :workflows, :user_id, :integer
  end
end
