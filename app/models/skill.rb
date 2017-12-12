class Skill < ApplicationRecord


  has_many :user_skill_relationships
  has_many :users, through: :user_skill_relationships, source: :user



end

# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
