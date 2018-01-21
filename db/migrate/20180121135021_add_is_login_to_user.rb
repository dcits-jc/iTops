class AddIsLoginToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_logined, :boolean,default: false
  end
end
