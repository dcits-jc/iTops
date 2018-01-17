class AddCostCenterToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :costcenter, :string
  end
end
