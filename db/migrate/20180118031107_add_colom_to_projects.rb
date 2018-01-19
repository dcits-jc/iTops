class AddColomToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :project_class, :string
    add_column :projects, :customer_company, :string
    add_column :projects, :customer_name, :string
    add_column :projects, :customer_phone, :string
    add_column :projects, :pm_name, :string
    add_column :projects, :area, :string
    add_column :projects, :project_start_time, :string
    add_column :projects, :project_end_time, :string
    add_column :projects, :submit_plan, :string
    add_column :projects, :other, :string
  end
end
