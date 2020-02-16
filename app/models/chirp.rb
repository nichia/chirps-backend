class Chirp < ApplicationRecord
  validates :text, length: { minimum: 1, maximum: 140 }
  
  scope :chirps_all_latest, -> { order("id DESC") }

end
