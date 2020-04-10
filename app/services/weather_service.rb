class WeatherService

  def self.get_data(destination)
    response = conn.get('weather') do |req|
      req.params['q'] = destination.name
      req.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def self.conn
      Faraday.new "https://api.openweathermap.org/data/2.5" do |conn|
        conn.params['appid'] = ENV['WEATHER_API_KEY']
      end
    end
end
