class Movie < ApplicationRecord
  has_many :rentals
  has_many :customers, through: :rentals
  validates :title, presence: true

  def can_checkout?
    self.available_inventory > 0 #break test cases
  end

  def increment_inventory
    self.available_inventory += 1
    self.save
  end

  def decrement_inventory
    self.available_inventory -= 1
    self.save
  end

end
