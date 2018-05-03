class Game < ApplicationRecord

  has_many :matches
  has_many :users, through: :matches
  has_one :score

end
