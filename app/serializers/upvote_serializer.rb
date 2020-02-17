class UpvoteSerializer < ActiveModel::Serializer
  attributes :chirp_id, :user_id

  belongs_to :chirp
  belongs_to :user
end
