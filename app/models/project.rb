class Project < ApplicationRecord

  has_many :workflows

  has_many :project_relationships
  has_many :members, through: :project_relationships, source: :user


  # 判断是否已经在项目组中
  def is_members?(user)
    members.include?(user)
  end



  # 成员加入项目
  def join!(user)
    members << user
  end


  # 是否禁止报工
  def workflow_disabled?
    self.disable_workflow
  end


  # 禁止报工
  def workflow_disabled!
    self.disable_workflow = true
    self.save
  end

  # 开启报工
  def workflow_enabled!
    self.disable_workflow = false
    self.save
  end



  # 成员退出项目
  def exit!(user)
    members.delete(user)
    if is_managers?(user)
      managers.delete(user)  
    end
  end  


  def hours_sum
    sum = 0
    self.workflows.pluck(:hours).each do |h|
      sum = sum + h
    end
    sum
  end


  def workhours(user_id)
    user_workflows = self.workflows.where(user_id: user_id)
    sum = 0
    user_workflows.each do |w|
      sum = sum + w.hours
    end
    sum
  end



end

# == Schema Information
#
# Table name: projects
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :string
#  project_type     :string
#  start_time       :datetime
#  end_time         :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  code             :string
#  sales_name       :string
#  sbu              :string
#  disable_workflow :boolean          default(FALSE)
#
