class Customer < ApplicationRecord
  has_many :rentals
  has_many :movies, through: :rentals
  validates :name, presence: true


  def increment_checked_out_count
    self.movies_checked_out_count += 1
    self.save
  end

  def decrement_checked_out_count
    self.movies_checked_out_count -= 1
    self.save
  end

end
