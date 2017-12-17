require 'test_helper'

class WeeklyTemplateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
