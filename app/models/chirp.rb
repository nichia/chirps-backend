class Chirp < ApplicationRecord
  validates :text, length: { maximum: 140 }
  
end
