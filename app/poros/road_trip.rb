class RoadTrip
  attr_reader :start_city, 
              :end_city, 
              :travel_time, 
              :weather_at_eta

  def initialize(origin, destination, time, forecast)
    @start_city = origin
    @end_city = destination
    @travel_time = format_time(time)
    @weather_at_eta = forecast
  end

  private
  def format_time(seconds)
    hours = Time.at(seconds).utc.strftime "%H"
    minutes = Time.at(seconds).utc.strftime "%M"
    "#{hours} hours, #{minutes} minutes"
  end
end