require "test_helper"

describe MoviesController do
  describe "index" do

    it "is a real working route and returns JSON" do
      get movies_path

      expect(response.header['Content-Type']).must_include 'json'
      must_respond_with :success
    end

    it "returns an Array" do
      get movies_path

      body = JSON.parse(response.body)

      expect(body).must_be_kind_of Array
    end

    it "returns all of the movies" do
      get movies_path
      body = JSON.parse(response.body)
      expect(body.length).must_equal Movie.count
    end

    it "returns movies with exactly the required fields" do
      fields = %w(id inventory overview release_date title)

      get movies_path

      body = JSON.parse(response.body)

      body.each do |movie|
        expect(movie.keys.sort).must_equal fields
        expect(movie.keys.length).must_equal fields.length
      end
    end
end

  describe "show" do

    it "is a real working route and returns JSON" do
      id = movies(:movie1).id

      get movie_path(id)

      expect(response.header['Content-Type']).must_include 'json'
      must_respond_with :success
    end

    it "can get a movie" do
      get movie_path(movies(:movie2).id)
      must_respond_with :success
    end

    it "responds with a 404 message if given invalid id" do
      id = -1
      get movie_path(id)
      must_respond_with :not_found
    end

  end

end
