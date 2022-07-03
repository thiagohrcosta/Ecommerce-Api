class License < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :game_id, presence: true
  validates :user_id, presence: true
  validates :key, presence: true
end
