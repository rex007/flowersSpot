# == Schema Information
#
# Table name: statistics
#
#  id          :integer          not null, primary key
#  record_type :string
#  record_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Statistic < ApplicationRecord
end
