class Tournament < ApplicationRecord
  has_many :rounds
  has_many :games, through: :rounds
  has_many :teams, through: :games
  belongs_to :admin, class_name: "User"

  validates :name, :event, :admin_id, presence: true

  validates :completed, inclusion: { in: [true, false] }
  
  validates_associated :rounds, :games, :teams

  validates :admin, absence: true

  scope :recent, -> { order("created_at DESC").limit(6) }

  # def winner
  #   if completed
  #     #something
  #   else
      # "Winner is not yet determined."
  #   end
  # end

  # def teams
  # end

  




end

