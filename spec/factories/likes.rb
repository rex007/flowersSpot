# == Schema Information
#
# Table name: likes
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  sightings_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_likes_on_sightings_id  (sightings_id)
#  index_likes_on_user_id       (user_id)
#

FactoryGirl.define do
  factory :like do
    user nil
    sightings nil
  end
end
