# == Schema Information
#
# Table name: sightings
#
#  id                   :integer          not null, primary key
#  flower_id            :integer
#  user_id              :integer
#  name                 :string
#  description          :text
#  latitude             :float
#  longitude            :float
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  question             :text
#
# Indexes
#
#  index_sightings_on_flower_id  (flower_id)
#  index_sightings_on_user_id    (user_id)
#

class SightingSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :picture, :question, :likes_count, :comments_count

  belongs_to :user, serializer: SightingsUserSerializer
  has_many :comments  
  has_many :likes  

  def picture
    object.picture.url(:medium)
  end

  def likes_count
    # remove this when counter cashe for likes is made
    object.likes.count
  end

  def comments_count
    # remove this when counter cashe for comments is made
    object.comments.count
  end
end
