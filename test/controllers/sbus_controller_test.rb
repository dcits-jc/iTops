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

require 'test_helper'

class SbusControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
