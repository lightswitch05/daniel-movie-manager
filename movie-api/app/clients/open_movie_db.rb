class OpenMovieDb
  def self.poster(movie)
    matching_movie = get_movie(movie)
    poster = matching_movie.fetch('Poster', nil)
    return poster if URI.regexp(%w[http https nil]).match?(poster)
  end

  private

    def self.get_movie(movie)
      return {} if !movie || !movie.valid?
      begin
        response = Faraday.get do |req|
          req.url 'https://www.omdbapi.com'
          req.options.timeout = 30           # open/read timeout in seconds
          req.options.open_timeout = 15      # connection open timeout in seconds
          req.headers['Content-Type'] = 'application/json'
          req.params = {
            apikey: Rails.application.credentials.omdb_api_key,
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
