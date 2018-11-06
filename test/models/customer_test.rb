require "test_helper"

describe Customer do
let(:customer){
  customer = Customer.new()
}

  it "must not create a customer without a name" do
    customer.valid?.must_equal false
  end

  it "can create a customer with a valid name " do
    customer.name = "Beans"
    customer.valid?.must_equal true

  end

  describe 'Relationships' do

    it 'customer can have many movies' do
      #customer = customers(:customer1)
      movies = customers(:customer1).movies
      expect(movies.count).must_be :>=, 1

      movies.each do |movie|
        expect(movie).must_be_instance_of Movie
      end
    end

    it "can have one or many rentals" do
      customer = customers(:customer1)
      expect(customer.rentals.count).must_be :>=, 1
    end

  end
end
