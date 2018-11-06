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

end
