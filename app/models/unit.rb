class Unit < ApplicationRecord

  # 一个部门拥有多个员工
  # has_many :users

  # 一个部门可能有多个领导
  has_many :user_leader_units
  has_many :unit_leaders, through: :user_leader_units, source: :user


  has_many :son_relationships, class_name: "UnitRelationship",
                                 foreign_key: 'father_id',
                                 dependent: :destroy
  has_one :father_relationships, class_name: "UnitRelationship",
                               foreign_key: 'son_id',
                               dependent: :destroy                                  

  has_many :sons, through: :son_relationships, source: :son                               
  has_one :father, through: :father_relationships, source: :father

  has_many :workflows

  
  
end

# == Schema Information
#
# Table name: units
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
