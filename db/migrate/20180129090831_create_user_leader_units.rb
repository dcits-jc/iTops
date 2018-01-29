class CreateUserLeaderUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :user_leader_units do |t|
      t.integer :user_id
      t.integer :unit_id
      t.timestamps
    end
  end
end
