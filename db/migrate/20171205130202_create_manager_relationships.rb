class CreateManagerRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :manager_relationships do |t|
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end
  end
end
