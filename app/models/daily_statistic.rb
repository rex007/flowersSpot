# == Schema Information
#
# Table name: daily_statistics
#
#  id            :integer          not null, primary key
#  new_flowers   :integer
#  new_sightings :integer
#  total_flowers :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class DailyStatistic < ApplicationRecord
end
