class CreateSbuLeaders < ActiveRecord::Migration[5.1]
  def change
    create_table :sbu_leaders do |t|
      t.integer :sbu_id
      t.integer :user_id
      t.timestamps
    end
  end
end
