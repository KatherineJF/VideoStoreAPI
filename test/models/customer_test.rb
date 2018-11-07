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

  describe "methods" do
    describe "Customer#increment_checked_out_count" do

      it "will increment a customers checked out count by 1" do
        customer = customers(:customer1)
        before = customer.movies_checked_out_count
        customer.increment_checked_out_count
        after = customer.movies_checked_out_count

        expect(after).must_be :>, before
      end

    end

    describe "Customer#decrement_checked_out_count" do

      it "will decrement a customers checked out count by 1" do
        customer = customers(:customer1)
        before = customer.movies_checked_out_count
        customer.decrement_checked_out_count
        after = customer.movies_checked_out_count

        expect(after).must_be :<, before
      end

    end

  end

end
