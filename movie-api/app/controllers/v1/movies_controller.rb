VALID_SORT_BYS = %w[title format length release_year rating].freeze
VALID_SORT_TYPE = %w[asc desc].freeze
DEFAULT_SORT_BY = 'title'.freeze
DEFAULT_SORT_TYPE = 'asc'.freeze

class V1::MoviesController < ApplicationController
  def create
    movie = Movie.new(create_movie_params)
    movie.poster = OpenMovieDb.poster(movie)
    if movie.save
      render json: movie, status: :created
    else
      render_errors(movie)
    end
  end

  def update
    movie = Movie.find(params[:id])
    movie.assign_attributes(update_movie_params)
    movie.poster = OpenMovieDb.poster(movie) if movie.title_changed? || movie.release_year_changed?
    if movie.save
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
    movies = Movie.order(sort_key).page(params[:page]).per(params[:per_page])
    response.headers['X-Pagination-Page'] = movies.current_page
    response.headers['X-Pagination-Per-Page'] = movies.limit_value
    response.headers['x-Pagination-Count'] = movies.total_count
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

  def sort_key
    sort_by = params.fetch(:sort_by, DEFAULT_SORT_BY)
    sort_type = params.fetch(:sort_type, DEFAULT_SORT_TYPE)

    sort_by = DEFAULT_SORT_BY if VALID_SORT_BYS.exclude?(sort_by)
    sort_type = DEFAULT_SORT_TYPE if VALID_SORT_TYPE.exclude?(sort_type)

    "#{sort_by} #{sort_type}"
  end
end
