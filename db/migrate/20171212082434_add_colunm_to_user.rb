class AddColunmToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :itcode, :string
    add_column :users, :code, :string
    add_column :users, :name, :string
    add_column :users, :sbu, :string
    add_column :users, :phone, :string
    add_column :users, :title, :string
    add_column :users, :level, :integer
    add_column :users, :cost, :integer
    add_column :users, :pm, :boolean,default: false
  end
end
