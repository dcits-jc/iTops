class WeeklyTemplate < ApplicationRecord

  has_many :weeklies, dependent: :destroy

  # 合计提交人数
  def user_submitcount
    workflows = Workflow.includes(:weekly).where(weeklies: {year: self.year,week: self.week})
    user_count = workflows.group_by{|w| w.user_id}.count
  end

  # 合计工时
  def weekly_workload_total
    workflows = Workflow.includes(:weekly).where(weeklies: {year: self.year,week: self.week})
    workflows.inject(0){|sum,e| sum+= e.hours }
  end

  # 合计费用
  def weekly_cost_total
    workflows = Workflow.includes(:weekly).where(weeklies: {year: self.year,week: self.week})
    workflows.inject(0){|sum,e| sum+= e.cost }
  end


  def create_weeklies!
    users = User.all
    users.each do |user|
      # 为所有的用户根据该模板创建周报
      weekly = Weekly.new
      weekly.year = self.year
      weekly.month = self.month
      weekly.week = self.week
      weekly.start_time = self.start_time
      weekly.end_time = self.end_time
      weekly.user = user
      weekly.weekly_template = self
      weekly.save
    end
  end

end

# == Schema Information
#
# Table name: weekly_templates
#
#  id         :integer          not null, primary key
#  year       :integer
#  month      :integer
#  week       :integer
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
