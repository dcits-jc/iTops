require 'test_helper'

class WeeklyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
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
