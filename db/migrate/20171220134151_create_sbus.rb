class CreateSbus < ActiveRecord::Migration[5.1]
  def change
    create_table :sbus do |t|
      t.string :name
      t.timestamps
    end
  end
end
