class CreateWorkflows < ActiveRecord::Migration[5.1]
  def change
    create_table :workflows do |t|
      t.text :description
      t.float :hours

      t.timestamps
    end
  end
end
