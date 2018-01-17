require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
#  cost_plan        :integer
#  cost_already     :integer
#
