class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body

  belongs_to :user, serializer: CommentsUserSerializer
end
