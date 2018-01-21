require 'test_helper'

class V1::MoviesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get v1_movies_url
    assert_response :success
  end

  test 'should get a movie' do
    get v1_movie_url(1)
    assert_response :success
  end

  test 'should not get a missing movie' do
    get v1_movie_url(923423)
    assert_response :not_found
  end

  test 'should delete a movie' do
    # verify it exists
    get v1_movie_url(3)
    assert_response :success
    # delete it
    delete v1_movie_url(3)
    assert_response :no_content
    # verify it was deleted
    get v1_movie_url(3)
    assert_response :not_found
  end

  test 'should delete a missing movie' do
    # verify it exists
    get v1_movie_url(234234)
    assert_response :not_found
    # delete it
    delete v1_movie_url(234234)
    assert_response :no_content
  end

  test 'should create a movie' do
    OpenMovieDb.stub :poster, 'https://example.com/movie.png' do
      post v1_movies_url, params: { movie: get_valid_movie_request }
      assert_response :success
    end
  end

  test 'should not create an invalid movie' do
    movie = get_valid_movie_request
    movie[:title] = nil
    OpenMovieDb.stub :poster, 'https://example.com/movie.png' do
      post v1_movies_url, params: { movie: movie }
      assert_response :unprocessable_entity
    end
  end

  test 'should update a movie' do
    get v1_movie_url(2)
    movie = JSON.parse @response.body
    movie['release_year'] += 1
    OpenMovieDb.stub :poster, 'https://example.com/movie.png' do
      put v1_movie_url(2), params: { movie: movie }
      assert_response :success
    end
  end

  test 'should ont update an invalid movie' do
    get v1_movie_url(2)
    movie = JSON.parse @response.body
    movie['release_year'] = nil
    OpenMovieDb.stub :poster, 'https://example.com/movie.png' do
      put v1_movie_url(2), params: { movie: movie }
      assert_response :unprocessable_entity
    end
  end

  private

  def get_valid_movie_request
    {
      title: 'test movie',
      format: 'DVD',
      length: 300,
      release_year: 2018,
      rating: 5
    }
  end
end
