class OpenMovieDb
  def self.poster(movie)
    matching_movie = fetch(movie)
    matching_movie.fetch('Poster', nil)
  end

  def self.fetch(movie)
    return {} if !movie || !movie.valid?
    api_key = Rails.application.secrets.omdb_api_key
    begin
      response = Faraday.get do |req|
        req.url 'https://www.omdbapi.com'
        req.options.timeout = 30           # open/read timeout in seconds
        req.options.open_timeout = 15      # connection open timeout in seconds
        req.headers['Content-Type'] = 'application/json'
        req.params = {
          apikey: api_key,
          t: movie.title,
          y: movie.release_year
        }
      end
      parse_response(response)
    rescue # rubocop:disable Style/RescueStandardError
      {}
    end
  end

  def self.parse_response(response)
    return {} if !response || response.status != 200
    begin
      JSON.parse(response.body) || {}
    rescue JSON::ParserError
      {}
    end
  end
end
