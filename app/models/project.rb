class Project < ApplicationRecord

  has_many :workflows

  has_many :project_relationships
  has_many :members, through: :project_relationships, source: :user

  has_many :manager_relationships
  has_many :managers, through: :manager_relationships, source: :user

  # 判断是否已经在项目组中
  def is_members?(user)
    members.include?(user)
  end

  # 判断是否是该项目管理员
  def is_managers?(user)
    managers.include?(user)
  end


  # 成员加入项目
  def join!(user)
    members << user
  end

  # 管理员管理项目
  def join_manager!(user)
    managers << user
  end



  # 成员退出项目
  def exit!(user)
    members.delete(user)
    if is_managers?(user)
      managers.delete(user)  
    end
  end  









end

# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  code        :string
#  sales_name  :string
#  sbu         :string
#
