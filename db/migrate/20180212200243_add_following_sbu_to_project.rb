class AddFollowingSbuToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :following_sbu, :string
  end
end
