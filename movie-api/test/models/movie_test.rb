require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test 'should save a valid movie' do
    movie = get_valid_movie
    assert movie.save
  end

  test 'should not save movie without title' do
    movie = get_valid_movie
    movie.title = nil
    assert_not movie.save
  end

  test 'should require format must be valid' do
    movie = get_valid_movie
    movie.format = 'other'
    assert_not movie.save
  end

  test 'should not allow format to be nil' do
    movie = get_valid_movie
    movie.format = nil
    assert_not movie.save
  end

  test 'should require length to not be 0' do
    movie = get_valid_movie
    movie.length = 0
    assert_not movie.save
  end

  test 'should require length to not be 500' do
    movie = get_valid_movie
    movie.length = 500
    assert_not movie.save
  end

  test 'should require length to be an integer' do
    movie = get_valid_movie
    movie.length = 5.5
    assert_not movie.save
  end

  test 'should require release_year to be greater than 1800' do
    movie = get_valid_movie
    movie.release_year = 1800
    assert_not movie.save
  end

  test 'should allow release_year to be 1801' do
    movie = get_valid_movie
    movie.release_year = 1801
    assert movie.save
  end

  test 'should allow release_year to be 2099' do
    movie = get_valid_movie
    movie.release_year = 2099
    assert movie.save
  end

  test 'should require release_year to be less than 2100' do
    movie = get_valid_movie
    movie.release_year = 2100
    assert_not movie.save
  end

  test 'should require release_year to be an integer' do
    movie = get_valid_movie
    movie.release_year = 2018.1
    assert_not movie.save
  end

  test 'should not allow rating to be nil' do
    movie = get_valid_movie
    movie.rating = nil
    assert_not movie.save
  end

  test 'should allow require rating to be an integer' do
    movie = get_valid_movie
    movie.rating = 5.5
    assert_not movie.save
  end

  test 'should allow require rating be greater than 0' do
    movie = get_valid_movie
    movie.rating = 0
    assert_not movie.save
  end

  test 'should allow require rating be 1' do
    movie = get_valid_movie
    movie.rating = 1
    assert movie.save
  end

  test 'should allow require rating be 5' do
    movie = get_valid_movie
    movie.rating = 5
    assert movie.save
  end

  test 'should allow require rating be less than 6' do
    movie = get_valid_movie
    movie.rating = 6
    assert_not movie.save
  end

  test 'should allow a title of length 1' do
    movie = get_valid_movie
    movie.title = 'A'
    assert movie.save
  end

  test 'should allow a title of length 50' do
    movie = get_valid_movie
    movie.title = '1' * 50
    assert movie.title.length == 50
    assert movie.save
  end

  test 'should require a title length at least 1' do
    movie = get_valid_movie
    movie.title = ''
    assert_not movie.save
  end

  test 'should require a title length at most 50' do
    movie = get_valid_movie
    movie.title = '1' * 51
    assert movie.title.length == 51
    assert_not movie.save
  end

  test 'should allow poster to be nil' do
    movie = get_valid_movie
    movie.poster = nil
    assert movie.save
  end

  test 'should allow poster to be an http url' do
    movie = get_valid_movie
    movie.poster = 'http://example.com/images/test.png'
    assert movie.save
  end

  test 'should allow poster to be an https url' do
    movie = get_valid_movie
    movie.poster = 'https://example.com/images/test.png'
    assert movie.save
  end

  test 'should not allow poster to be a non-url format' do
    movie = get_valid_movie
    movie.poster = 'not-a-url.com'
    assert_not movie.save
  end

  def get_valid_movie
    movie = Movie.new
    movie.title = 'test movie'
    movie.format = 'DVD'
    movie.length = 300
    movie.release_year = 2018
    movie.rating = 5
    movie.poster = 'https://example.com/poster'
    return movie
  end
end
