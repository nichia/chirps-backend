class Chirp < ApplicationRecord
  has_many :upvotes
  has_many :voted_by, through: :upvotes, source: :user

  validates :text, length: { minimum: 1, maximum: 140 }
  
  scope :chirps_all_latest, -> { order("id DESC") }

end
