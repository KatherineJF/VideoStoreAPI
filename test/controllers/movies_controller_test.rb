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
      fields = %w(id inventory overview release_date title available_inventory)

      get movies_path

      body = JSON.parse(response.body)

      body.each do |movie|
        expect(movie.keys.sort).must_equal fields.sort
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

  describe "create" do
    let(:movie_data) {
      {
      title: "Savior Of The Curse",
      overview: "The strange woman claims the boy has a DNA strain which very likely offers the key to cure several crippling diseases. Tests will have to be done, but the key to save millions of lives is within the grasp of science through this DNA strain. Unsure what to think of all this and of this strange woman, the boy hesitantly agrees to the proposal, there's something exciting about this whole situation, surely the right choice was made.",
      release_date: "2010-11-05",
      inventory: 1,
      available_inventory: 1
      }
    }

    it "creates a new movie given valid data" do
        expect {
        post movies_path, params: movie_data
      }.must_change "Movie.count", 1

      body = JSON.parse(response.body)
      expect(body).must_be_kind_of Hash
      expect(body).must_include "id"

      movie = Movie.find(body["id"].to_i)

      expect(movie.title).must_equal movie_data[:title]
      must_respond_with :success
    end

    it "returns an error for missing needed movie info to create object" do
        expect {
        post movies_path
      }.wont_change "Movie.count"

      body = JSON.parse(response.body)

      expect(body).must_be_kind_of Hash
      expect(body).must_include "message"
      expect(body["message"]).must_include "title"
      must_respond_with :bad_request
    end

  end

end
