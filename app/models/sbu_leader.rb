class SbuLeader < ApplicationRecord

  belongs_to :sbu
  belongs_to :user
end

# == Schema Information
#
# Table name: sbu_leaders
#
#  id         :integer          not null, primary key
#  sbu_id     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
