class Rental < ApplicationRecord
  belongs_to :movie
  belongs_to :customer
  validates :movie, :customer, presence: true
end
