class UserSkillRelationship < ApplicationRecord
end

# == Schema Information
#
# Table name: user_skill_relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  skill_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
