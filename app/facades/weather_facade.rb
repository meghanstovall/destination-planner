class WeatherFacade
  attr_reader :data, :destination

  def initialize(id)
    @destination = Destination.find(id)
    @data = WeatherService.get_data(@destination)

    @giphy = GiphyService.get_response(summary)[:data][0]
  end

  def current_weather
    @data[:main][:temp]
  end

  def max_temp
    @data[:main][:temp_max]
  end

  def min_temp
    @data[:main][:temp_min]
  end

  def summary
    @data[:weather][0][:description]
  end

  def giphy
    @giphy[:images][:downsized_large][:url]
  end
end
