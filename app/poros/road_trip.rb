class RoadTrip
  attr_reader :id,
              :start_city, 
              :end_city, 
              :travel_time, 
              :weather_at_eta

  def initialize(origin, destination, time, forecast)
    @id = nil
    @start_city = origin
    @end_city = destination
    @travel_time = format_time(time)
    @weather_at_eta = forecast
  end

  private
  def format_time(seconds)
    if seconds == "impossible"
      "impossible"
    elsif seconds >= 86400 && seconds < 172800
      hours = Time.at(seconds).utc.strftime "%-H"
      minutes = Time.at(seconds).utc.strftime "%-M"
      "1 day, #{hours} hours, #{minutes} minutes"

    elsif seconds > 172800
      days = Time.at(seconds).utc.strftime "%-d"
      hours = Time.at(seconds).utc.strftime "%-H"
      minutes = Time.at(seconds).utc.strftime "%-M"
      "#{days} days, #{hours} hours, #{minutes} minutes"
    else
      hours = Time.at(seconds).utc.strftime "%-H"
      minutes = Time.at(seconds).utc.strftime "%-M"
      "#{hours} hours, #{minutes} minutes"
    end
  end
end