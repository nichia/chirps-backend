class ChirpSerializer < ActiveModel::Serializer
  attributes :id, :text

  has_many :upvotes
  has_many :upvoted_by, through: :upvotes, source: :user
end
