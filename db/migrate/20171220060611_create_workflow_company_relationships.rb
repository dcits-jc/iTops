class CreateWorkflowCompanyRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :workflow_company_relationships do |t|
      t.integer :workflow_id
      t.integer :company_id

      t.timestamps
    end
  end
end
