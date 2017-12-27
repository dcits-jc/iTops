class Weekly < ApplicationRecord



  has_many :workflows, dependent: :destroy
  belongs_to :user

  belongs_to :weekly_template

  scope :order_by_created_at, -> { order("created_at DESC") }
  # def current_week
  #   current_user.weeklies.last
  # end
  scope :order_by_week, -> { order("week DESC") }


  def workflows_group_by_project
    self.workflows.group_by{|w| w.project}
  end



  def workload_sum
    sum_workhours = 0
    self.workflows.each do |workflow|
      sum_workhours = sum_workhours + workflow.hours
    end
    sum_workhours
  end


end

# == Schema Information
#
# Table name: weeklies
#
#  id                 :integer          not null, primary key
#  year               :integer
#  month              :integer
#  week               :integer
#  description        :text
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  start_time         :datetime
#  end_time           :datetime
#  weekly_template_id :integer
#
