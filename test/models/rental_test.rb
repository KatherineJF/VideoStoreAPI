require "test_helper"

describe Rental do
    let(:rental) {
      rental = Rental.new
    }

    describe "validations" do
      it "cannot create rental without a customer" do
        rental.valid?.must_equal false

        rental.movie = movies(:movie1)
        rental.valid?.must_equal false
      end

      it "cannot create rental without a movie" do
        rental.valid?.must_equal false

        rental.customer = customers(:customer1)
        rental.valid?.must_equal false
      end

      it "can create rental with movie and title" do
        rental.customer = customers(:customer1)
        rental.movie = movies(:movie1)
        rental.valid?.must_equal true
      end
    end

    describe "relationships" do
      it "has one customer" do
        rental = rentals(:one)

        expect(rental.customer).must_be_instance_of Customer
      end

      it "has one movie" do
          rental = rentals(:one)

          expect(rental.movie).must_be_instance_of Movie
      end
    end

    describe "methods" do
      it "It can return a rental when given movie_id and customer_id" do
        rental = rentals(:two)
        customer = customers(:customer1).id
        movie = movies(:movie2).id
        rental_return = Rental.get_rental(customer, movie)
        expect(rental_return).must_equal rental
      end

      it "It won't return a rental when given invalid movie_id or customer_id" do


      end
    end

end
