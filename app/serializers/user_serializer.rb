class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :firstname, :lastname

  has_many :upvotes
  has_many :upvoted_for, through: :upvotes, source: :chirp
end
