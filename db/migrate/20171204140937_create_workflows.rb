class CreateWorkflows < ActiveRecord::Migration[5.1]
  def change
    create_table :workflows do |t|
      t.string :name
      t.string :description
      t.integer :hours

      t.timestamps
    end
  end
end
