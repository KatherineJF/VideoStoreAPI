require "test_helper"

describe RentalsController do
  it "should get update" do
    get rentals_update_url
    value(response).must_be :success?
  end

  it "should get destroy" do
    get rentals_destroy_url
    value(response).must_be :success?
  end

  it "should get index" do
    get rentals_index_url
    value(response).must_be :success?
  end

  it "should get create" do
    get rentals_create_url
    value(response).must_be :success?
  end

end
