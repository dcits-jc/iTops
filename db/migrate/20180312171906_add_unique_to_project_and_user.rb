class AddUniqueToProjectAndUser < ActiveRecord::Migration[5.1]
  def change
    # 用户 code 不能重复
    add_index :users, :itcode, unique: true

    # sbu名 不能重复
    add_index :sbus, :name, unique: true

    # # 项目名不能重复
    # add_index :projects, :name, unique: true
    # # 项目号不能重复
    # add_index :projects, :code, unique: true    
  end
end
