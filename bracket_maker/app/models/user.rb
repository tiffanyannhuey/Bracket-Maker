class User < ApplicationRecord
  has_many :tournaments, foreign_key: :admin_id
  has_many :games, through: :tournaments

  validates :username, :email, :password, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
