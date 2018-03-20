class LikeSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :user, serializer: LikesUserSerializer
end
