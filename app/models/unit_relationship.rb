class UnitRelationship < ApplicationRecord


  belongs_to :father, class_name: 'Unit'
  belongs_to :son, class_name: 'Unit'

  validates :father_id, presence: true
  validates :son_id, presence: true








end

# == Schema Information
#
# Table name: unit_relationships
#
#  id         :integer          not null, primary key
#  father_id  :integer
#  son_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
