class User < ApplicationRecord
  has_many :tournaments

  validates :username, :email, presence: true

  has_secure_password

end
