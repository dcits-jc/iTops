# == Schema Information
#
# Table name: workflows
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :string
#  hours           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  project_id      :integer
#  user_id         :integer
#  aasm_state      :string           default("processing")
#  weekly_id       :integer
#  begin_time      :datetime
#  end_time        :datetime
#  worktype        :string
#  remaining_issue :text
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
