class Project < ApplicationRecord

  has_many :workflows

  has_many :project_relationships
  has_many :members, through: :project_relationships, source: :user


  # 管理员关系
  has_many :project_manages
  has_many :managers, through: :project_manages, source: :user



  # 判断是否已经在项目组中
  def is_members?(user)
    members.include?(user)
  end



  # 成员加入项目
  def join!(user)
    members << user
  end



  # 判断是否已经在项目组中
  def is_managers?(user)
    managers.include?(user)
  end



  # 成员加入项目
  def join_manager!(user)
    managers << user
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


  def workflows_group_by_project
    self.workflows.group_by{|w| w.project}
  end


  def workflows_group_by_user
    self.workflows.group_by{|w| w.user}
  end


  # 一个项目都用到了哪些产品
  def used_companies
    company_list = []
    self.workflows.each do |w|
      company_list << w.companies
    end
    company_list = company_list.flatten.uniq
  end


  # 涉及的产品及工作量
  def used_companies_hours
    companies_hour_obj = {}
    self.used_companies.each do |c|
      companies_hour_obj[c.name] = 0
    end
    # 循环每个工作流
    self.workflows.each do |w|
      # 涉及的产品公司
      self.used_companies.each do |c|
        if w.companies.include?(c)
          companies_hour_obj[c.name] = companies_hour_obj[c.name]+w.hours
        end
      end
    end
    companies_hour_obj
  end




  def addCost!(cost)
    self.cost_already.present? ? self.cost_already=self.cost_already+cost : self.cost_already=cost 
    self.save
  end



  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |project|
        csv << project.attributes.values_at(*column_names)
      end
    end.encode('gb2312', :invalid => :replace, :undef => :replace, :replace => "?") 
  end

end

# == Schema Information
#
# Table name: projects
#
#  id                 :integer          not null, primary key
#  name               :string
#  description        :string
#  project_type       :string
#  start_time         :datetime
#  end_time           :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  code               :string
#  sales_name         :string
#  sbu                :string
#  disable_workflow   :boolean          default(FALSE)
#  cost_plan          :integer
#  cost_already       :integer
#  project_class      :string
#  customer_company   :string
#  customer_name      :string
#  customer_phone     :string
#  pm_name            :string
#  area               :string
#  project_start_time :string
#  project_end_time   :string
#  submit_plan        :string
#  other              :string
#
