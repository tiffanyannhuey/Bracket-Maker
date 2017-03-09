class Tournament < ApplicationRecord
  has_many :rounds
  has_many :teams
  has_many :games, through: :rounds
  belongs_to :admin, class_name: "User"


  validates :name, :event_type, :admin_id, presence: true

  validates_associated :rounds, :teams,  :games

  scope :recent, -> { order("created_at DESC").limit(6) }

end

