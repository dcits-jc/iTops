class Workflow < ApplicationRecord
  validates :project_id, presence: true
  validates :name, presence: true
  validates :worktype, presence: true
  validates :hours, presence: true



  belongs_to :project
  belongs_to :user

  belongs_to :weekly




  has_many :workflow_skill_relationships
  has_many :skills, through: :workflow_skill_relationships, source: :skill

  has_many :workflow_company_relationships
  has_many :companies, through: :workflow_company_relationships, source: :company



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
#  start_time      :datetime
#  end_time        :datetime
#  worktype        :string
#  remaining_issue :text
#
# Indexes
#
#  index_workflows_on_aasm_state  (aasm_state)
#
