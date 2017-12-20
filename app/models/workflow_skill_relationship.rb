class WorkflowSkillRelationship < ApplicationRecord

  belongs_to :workflow
  belongs_to :skill

end

# == Schema Information
#
# Table name: workflow_skill_relationships
#
#  id          :integer          not null, primary key
#  workflow_id :integer
#  skill_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
