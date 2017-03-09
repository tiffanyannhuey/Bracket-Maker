class User < ApplicationRecord
  has_many :tournaments, { foreign_key: :admin_id }

  validates :username, :email, presence: true

  has_secure_password

end
