class Munchie
  attr_reader :id, :destination_city, :travel_time, :forecast, :restaurant

  def initialize(start, destination, food)
    time = DirectionFacade.get_time(start, destination)
    arrival_time = calc_arrival(time)
    @id = nil
    @destination_city = format_destination(destination)
    @travel_time = format_time(time)
    @forecast = FinalForecastFacade.get_forecast(destination)
    @restaurant = RestaurantFacade.get_restaurant(arrival_time, destination, food)
  end


  private

  def format_destination(destination)
    city_format = destination.gsub(/[,]/, ', ').capitalize
  end

  def format_time(seconds)
    hours = Time.at(seconds).utc.strftime "%H"
    minutes = Time.at(seconds).utc.strftime "%M"
    "#{hours} hours #{minutes} minutes"
  end

  def calc_arrival(time)
    open_at = Time.now.utc + time
    open_at.to_time.to_i
  end
end