class CreateProjectManages < ActiveRecord::Migration[5.1]
  def change
    create_table :project_manages do |t|
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end
  end
end
