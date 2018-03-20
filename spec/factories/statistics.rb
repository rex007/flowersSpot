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

FactoryGirl.define do
  factory :statistic do
    record_type "MyString"
    record_id 1
  end
end
