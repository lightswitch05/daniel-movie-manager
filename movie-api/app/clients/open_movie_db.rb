class OpenMovieDb
  def self.poster(movie)
    matching_movie = fetch(movie)
    matching_movie.fetch('Poster', nil)
  end

  def self.fetch(movie)
    return nil if !movie || !movie.valid?
    api_key = Rails.application.secrets.omdb_api_key
    begin
      response = Faraday.get 'https://www.omdbapi.com', apikey: api_key, t: movie.title, y: movie.release_year
      parse_response(response)
    rescue # rubocop:disable Style/RescueStandardError
      {}
    end
  end

  def self.parse_response(response)
    return nil if !response || response.status != 200
    begin
      JSON.parse(response.body)
    rescue JSON::ParserError
      {}
    end
  end
end
