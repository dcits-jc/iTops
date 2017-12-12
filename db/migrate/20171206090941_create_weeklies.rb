class CreateWeeklies < ActiveRecord::Migration[5.1]
  def change
    create_table :weeklies do |t|
      t.integer :year
      t.integer :month
      t.integer :week
      t.text    :description
      t.integer :user_id
      t.timestamps
    end
  end
end
