require "test_helper"

describe Rental do
  let(:rental) { Rental.new }

  it "must be valid" do
    value(rental).must_be :valid?
  end
end

#Create real working routes
#Create with invalid data
#create with invalid data
#Make sure that the database count goes up
