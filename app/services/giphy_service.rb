class GiphyService

  def self.get_response(description)
    response = conn.get('search') do |req|
      req.params['q'] = description
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def self.conn
      Faraday.new "https://api.giphy.com/v1/gifs" do |conn|
        conn.params['api_key'] = ENV['GIPHY_API_KEY']
      end
    end
end
