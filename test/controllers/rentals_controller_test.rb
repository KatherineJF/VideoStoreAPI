require "test_helper"

describe RentalsController do
  describe "create" do
    let(:rental_params) {
      {
      movie_id: movies(:movie1).id,
      customer_id: customers(:customer1).id
      }
    }

    it "creates a new rental given valid data" do
        expect {
        post rental_checkout_path, params: rental_params
      }.must_change "Rental.count", 1

      body = JSON.parse(response.body)
      expect(body).must_be_kind_of Hash
      expect(body).must_include "id"

      rental = Rental.find(body["id"].to_i)

      expect(rental.movie).must_equal movies(:movie1)
      expect(rental.customer).must_equal customers(:customer1)
      must_respond_with :success
    end

    it "returns an error for missing needed movie info to create object" do
        expect {
        post rental_checkout_path
      }.wont_change "Rental.count"

      body = JSON.parse(response.body)

      expect(body).must_be_kind_of Hash
      expect(body).must_include "message"
      expect(body["message"]).must_include "customer"
      must_respond_with :bad_request
    end

  end

  describe "update" do
    let(:rental_params) {
      {
      movie_id: movies(:movie1).id,
      customer_id: customers(:customer1).id
      }
    }

    it "can update a rental when movie returned" do
        post rental_checkout_path, params: rental_params

        rental = Rental.last
        expect(rental.returned).must_equal nil

          expect {
          post rental_checkin_path, params: rental_params
        }.wont_change "Rental.count"

        binding.pry
        rental.reload
        expect(rental.returned).must_equal DateTime.now

        body = JSON.parse(response.body)

        expect(body).must_be_kind_of Hash
        expect(body).must_include "id"
        must_respond_with :success
    end
  #

  # it "should get destroy" do
  #   get rentals_destroy_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get index" do
  #   get rentals_index_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get create" do
  #   get rentals_create_url
  #   value(response).must_be :success?
  # end
  end

end
