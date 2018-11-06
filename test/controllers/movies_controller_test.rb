require "test_helper"

describe MoviesController do
  it "should get index" do
    get movies_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get movies_show_url
    value(response).must_be :success?
  end


    # This bit is up to you!
    it "can get a movie" do
      get movie_path(movies(movie2).id)
      must_respond_with :success
    end

    it "responds with a 404 message if no movie is found" do
      id = -1
      get movie_path(id)
      must_respond_with :not_found
    end



  it "should get create" do
    get movies_create_url
    value(response).must_be :success?
  end

  it "should get update" do
    get movies_update_url
    value(response).must_be :success?
  end


end
