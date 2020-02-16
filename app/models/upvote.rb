class Upvote < ApplicationRecord
  belongs_to :chirp
  belongs_to :user

end
