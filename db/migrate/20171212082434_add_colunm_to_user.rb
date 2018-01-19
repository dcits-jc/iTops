class AddColunmToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :itcode, :string
    add_column :users, :code, :string
    add_column :users, :name, :string
    add_column :users, :sbu_id, :integer
    add_column :users, :phone, :string
    add_column :users, :title, :string
    add_column :users, :level, :string
    add_column :users, :cost, :integer
    add_column :users, :sbu_name, :string
    add_column :users, :area, :string
    add_column :users, :status, :string
    add_column :users, :job_class, :string
    add_column :users, :pm, :boolean,default: false
  end
end
