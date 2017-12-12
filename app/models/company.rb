class Company < ApplicationRecord



  has_many :user_company_relationships
  has_many :users, through: :user_company_relationships, source: :user

end

# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
