class Round < ApplicationRecord
  belongs_to :tournament
  has_one :admin, through: :tournament
  has_many :games
  has_many :teams, through: :games
end
