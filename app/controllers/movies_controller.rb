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
    movie = Movie.new(movie_params)
    if movie.save
       render json: { id: movie.id }, status: :ok
    else
      render json: {
        message: movie.errors.messages
      }, status: :bad_request
    end
  end

  def update
  end

  private

  def movie_params
    params.permit(:title, :release_date, :overview, :inventory)
  end

end
