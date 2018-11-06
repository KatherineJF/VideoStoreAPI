class Movie < ApplicationRecord
  has_many :rentals
  has_many :customers, through: :rentals
  validates :title, presence: true

  def can_checkout?
    self.inventory >= 1
  end

  def increment_inventory
    self.inventory += 1
    self.save
  end

  def decrement_inventory
    self.inventory -= 1
    self.save
  end

end
