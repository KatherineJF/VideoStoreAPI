require "test_helper"

describe Movie do
  describe "validations" do
    let(:movie) {
      movie = Movie.new
    }

    it "will not create movie without a title" do
      movie.valid?.must_equal false
    end

    it "can be created with just a title" do
      movie.title = "Test Title"

      movie.valid?.must_equal true
    end

  end


  describe "relationship" do
    let(:movie) {
     movie = movies(:movie1)
    }

    it "can have one or many customers" do
        customers = movie.customers

        expect(customers.count).must_be :>=, 1

        customers.each do |customer|
          expect(customer).must_be_instance_of Customer
        end
    end

    it "can have one or many rentals" do
      expect(movie.rentals.count).must_be :>=, 1
    end
  end

  describe "methods" do
    describe "Movie#can_checkout" do

      it "returns true if there is available inventory" do
        movie = movies(:movie1)
        expect(movie.can_checkout?).must_equal true
      end

      it "returns false if there is available inventory" do
        movie = movies(:movie4)
        expect(movie.can_checkout?).must_equal false
      end

    end

    describe "Movie#increment_inventory" do

      it "will increment a movies available_inventory by 1" do
        movie = movies(:movie1)
        before = movie.available_inventory
        movie.increment_inventory
        after = movie.available_inventory

        expect(after).must_be :>, before
      end

    end

    describe "Movie#decrement_inventory" do

      it "will decrement a movies available_inventory by 1" do
        movie = movies(:movie1)
        before = movie.available_inventory
        movie.decrement_inventory
        after = movie.available_inventory

        expect(after).must_be :<, before
      end

    end

  end

end
