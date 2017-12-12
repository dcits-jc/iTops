class Workflow < ApplicationRecord

  belongs_to :project
  belongs_to :user

  belongs_to :weekly

  has_many :companies
  has_many :skills


  # 加入状态机
  include AASM

  aasm do
    state :processing, initial: true
    state :confirmed

    # 确认报工
    event :confirm do
      transitions from: :processing, to: :confirmed
    end

  end


end

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
