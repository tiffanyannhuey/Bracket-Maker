class Round < ApplicationRecord
  belongs_to :tournament
  has_one :admin, through: :tournament
  has_many :games, ->{ order(:position) }
  has_many :teams, through: :games
end
