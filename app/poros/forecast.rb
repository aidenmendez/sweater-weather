class Forecast
  attr_reader :current_weather, :daily_weather, :hourly_weather, :id

  def initialize(data)
    @id = nil
    @current_weather = format_currently(data[:current])
    @daily_weather = format_daily(data[:daily])
    @hourly_weather = format_hourly(data[:hourly])
  end

  private
  def format_currently(data)
    Currently.new(data)
  end

  def format_daily(data)
    days = data.map do |day|
      Daily.new(day)
    end

    days[1..5]
  end

  def format_hourly(data)
    hours = data[1..8]
    hours.map do |hour|
      Hourly.new(hour)
    end
  end
end