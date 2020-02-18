class Chirp < ApplicationRecord
  has_many :upvotes
  has_many :upvoted_by, through: :upvotes, source: :user

  validates :text, length: { minimum: 1, maximum: 140 }
      
  # Order list of chirps by newest chirp at the top
  scope :chirps_all_latest, -> { order("id DESC") }

  # Order list of chirps by recency follow by number of upvotes
  def self.chirps_by_latest_upvotes
    Chirp.left_joins(:upvotes)
      .group('chirps.id')
      .order('DATE(chirps.created_at) DESC, count(upvotes.id) DESC')
  end

end
