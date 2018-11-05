class MoviesController < ApplicationController

  def index
      movies = Movie.all
      render json: movies, status: :ok
  end

  def show
  end

  def create
  end

  def update
  end
end
