class Tournament < ApplicationRecord
  has_many :rounds
  has_many :games, through: :rounds
  has_many :teams, through: :games
  belongs_to :admin, class_name: "User"

  validates :name, :event, :admin_id, presence: true
  
  validates_associated :rounds

  scope :recent, -> { order("created_at DESC").limit(6) }

end

