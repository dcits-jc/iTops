class Sbu < ApplicationRecord

  has_many :users

end

# == Schema Information
#
# Table name: sbus
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
