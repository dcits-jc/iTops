# == Schema Information
#
# Table name: workflows
#
#  id               :integer          not null, primary key
#  description      :text
#  hours            :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  project_id       :integer
#  user_id          :integer
#  aasm_state       :string           default("processing")
#  weekly_id        :integer
#  start_time       :datetime
#  end_time         :datetime
#  remaining_issue  :text
#  workflow_type_id :integer
#  other_skill      :string
#  other_company    :string
#
# Indexes
#
#  index_workflows_on_aasm_state  (aasm_state)
#

require 'test_helper'

class WorkflowsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
