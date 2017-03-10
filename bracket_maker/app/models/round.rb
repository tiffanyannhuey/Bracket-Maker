class Round < ApplicationRecord
  belongs_to :tournament
  has_one :admin, through: :tournament
  has_many :games
  has_many :teams, through: :games

  validates :number, presence: true

  validates_associated :games, :teams, :tournament

  validates_presence_of :admin
end
