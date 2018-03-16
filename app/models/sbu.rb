class Sbu < ApplicationRecord

  has_many :sbu_leaders
  has_many :sbu_managers, through: :sbu_leaders,source: :user


  def add_manager!(user)
    self.sbu_managers << user
    self.save
  end

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
# Indexes
#
#  index_sbus_on_name  (name) UNIQUE
#
