class V1::MoviesController < ApplicationController
  def create
    movie = Movie.new(create_movie_params)
    if movie.save
      render json: movie, status: :created
    else
      render_errors(movie)
    end
  end

  def update
    movie = Movie.find(params[:id])
    if movie.update(update_movie_params)
      render json: movie
    else
      render_errors(movie)
    end
  end

  def destroy
    Movie.delete(params[:id])
    head :no_content
  end

  def index
    movies = Movie.all
    render json: movies
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
  end

  private

  def render_errors(movie)
    render json: movie.errors.messages, status: :unprocessable_entity
  end

  # Force required Movie params for +create+
  def create_movie_params
    params.require(:movie).permit(:title, :format, :length, :release_year, :rating)
  end

  # Force required Movie params for +update+
  def update_movie_params
    params.require(:movie).permit(:title, :format, :length, :release_year, :rating)
  end
end
