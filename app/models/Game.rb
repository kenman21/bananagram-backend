class Game < ApplicationRecord

  has_many :matches
  has_many :users, through: :matches
  has_one :score
  has_many :letters

  attr_accessor :shuffled_letters

  def create_letters
    letters = {
      "A": 13,
      "B": 3,
      "C": 3,
      "D": 6,
      "E": 18,
      "F": 3,
      "G": 4,
      "H": 3,
      "I": 12,
      "J": 2,
      "K": 2,
      "L": 5,
      "M": 3,
      "N": 8,
      "O": 11,
      "P": 3,
      "Q": 2,
      "R": 9,
      "S": 6,
      "T": 9,
      "U": 6,
      "V": 3,
      "W": 3,
      "X": 2,
      "Y": 3,
      "Z": 2
    }

    letters.each do |letter, num_times|
      num_times.times do
          Letter.create({
            value: letter.to_s,
            game: self
          })
      end
    end
  end

end
