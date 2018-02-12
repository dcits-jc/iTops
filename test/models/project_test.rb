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
#  is_temp            :boolean          default(FALSE)
#  following_sbu      :string
#
