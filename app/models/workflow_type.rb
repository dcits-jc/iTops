class WorkflowType < ApplicationRecord

  has_many :workflows


end

# == Schema Information
#
# Table name: workflow_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
