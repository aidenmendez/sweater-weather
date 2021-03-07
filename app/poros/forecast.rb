class Forecast
  attr_reader :current_weather, :daily_weather, :hourly_weather

  def initialize(data)
    @current_weather = format_current(data[:current])
    @daily_weather = format_daily(data[:daily])
    @hourly_weather = format_daily(data[:hourly])
    @temperature = data[:temp]
  end

  private
  def format_current(data)
    # Time.at(data[:dt])
    Current.new(data)
  end

  def format_daily(data)
    require 'pry'; binding.pry
    data.map do |day|
      Daily.new(day)
    end.limit(5)
  end


end