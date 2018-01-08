class AddNonprojectSalesToWorkflow < ActiveRecord::Migration[5.1]
  def change
    add_column :workflows, :project_sales, :string
  end
end
