class UserCompanyRelationship < ApplicationRecord
end

# == Schema Information
#
# Table name: user_company_relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
