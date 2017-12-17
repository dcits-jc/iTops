class WeeklyTemplate < ApplicationRecord

  has_many :weeklies


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
