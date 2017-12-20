class Weekly < ApplicationRecord



  has_many :workflows, dependent: :destroy
  belongs_to :user

  belongs_to :weekly_template

  scope :order_by_created_at, -> { order("created_at DESC") }
  # def current_week
  #   current_user.weeklies.last
  # end

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
