class Rental < ApplicationRecord
  belongs_to :movie
  belongs_to :customer
  validates :movie, :customer, presence: true

  def self.get_rental(movie_id, customer_id)
    binding.pry
    # returning rental with oldest due date incase customer has multiple rentals for same movie
    return Rental.where(movie_id: movie_id, customer_id: customer_id, returned: nil ).order(due_date: :asc).first
  end
end
