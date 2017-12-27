class CreateWorkflowSkillRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :workflow_skill_relationships do |t|
      t.integer :workflow_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
