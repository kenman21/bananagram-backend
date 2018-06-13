class User < ApplicationRecord
  has_secure_password

  has_many :matches
  has_many :games, through: :matches

  validates :password_digest, presence: true

end
