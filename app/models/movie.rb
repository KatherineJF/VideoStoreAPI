class Movie < ApplicationRecord
  has_many :customers, through: :rentals
  validates :title, presence: true
end
