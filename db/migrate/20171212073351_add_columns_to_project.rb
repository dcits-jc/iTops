class AddColumnsToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :code, :string
    add_column :projects, :sales_name, :string
    add_column :projects, :sbu, :string
    

  end
end
