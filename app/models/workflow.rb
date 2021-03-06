class Workflow < ApplicationRecord
  validates :project_id, presence: true
  validates :description, presence: true
  # validates :worktype, presence: true
  validates :workflow_type_id, presence: true
  validates :hours, presence: true



  belongs_to :project
  belongs_to :user

  belongs_to :weekly

  # belongs_to :unit


  has_many :workflow_skill_relationships
  has_many :skills, through: :workflow_skill_relationships, source: :skill

  has_many :workflow_company_relationships
  has_many :companies, through: :workflow_company_relationships, source: :company


  belongs_to :workflow_type

  scope :order_by_project_id, -> { order("project_id DESC") }

  scope :order_by_created_at, -> { order("created_at DESC") }

  # 按开始时间排序
  scope :order_by_start_time, -> { order("start_time DESC") }

  # 联合查询时候按用户名排序
  scope :order_by_user_id, -> { order("workflows.user_id DESC") }



  def self.to_csv(options = {})
    # CSV.generate_line(self, options)
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end


  def workfor_unit_name
    Unit.find(self.project_unit).name
  end




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
#  id               :integer          not null, primary key
#  description      :text
#  hours            :float
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
#  project_sales    :string
#  cost             :float
#  unit_id          :integer
#  project_name     :string
#  project_unit     :integer
#
# Indexes
#
#  index_workflows_on_aasm_state  (aasm_state)
#
