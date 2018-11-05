class MoviesController < ApplicationController

  def index
      movies = Movie.all
      render json: movies, status: :ok
  end

    def show
    movie = Movie.find_by(id: params[:id])
    if movie.nil?
      render json: {ok: false, message: 'not found'}, status: :not_found
    else
      render json: movie.as_json(except: [:created_at, :updated_at]), status: :ok
    end
  end

  def create
  end

  def update
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date, :overview, :inventory)
  end
end
