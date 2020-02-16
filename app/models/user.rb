class User < ApplicationRecord
  validates :username, :firstname, :lastname, :presence => true
  validates :username, :uniqueness => true

  has_many :upvotes
  has_many :voted_for, through: :upvotes, source: :chirp

end
