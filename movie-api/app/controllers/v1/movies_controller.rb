class V1::MoviesController < ApplicationController

  def create
    movie = Movie.new(create_movie_params)
    movie.save
    render json: movie, status: :created
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(update_movie_params)
    render json: movie
  end

  def delete
    Movie.delete(params[:id])
    render nothing: true, status: :no_content
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

  # Force required Movie params for +create+
  def create_movie_params
    params.require(:movie).permit(:title, :format, :length, :release_year, :rating)
  end

  # Force required Movie params for +update+
  def update_movie_params
    params.require(:movie).permit(:title, :format, :length, :release_year, :rating)
  end
end
