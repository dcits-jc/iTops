class WorkflowCompanyRelationship < ApplicationRecord

  belongs_to :workflow
  belongs_to :company
  
end

# == Schema Information
#
# Table name: workflow_company_relationships
#
#  id          :integer          not null, primary key
#  workflow_id :integer
#  company_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
