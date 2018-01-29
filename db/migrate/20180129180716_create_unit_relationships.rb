class CreateUnitRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :unit_relationships do |t|
      t.integer :father_id
      t.integer :son_id


      t.timestamps
    end
  end
end
