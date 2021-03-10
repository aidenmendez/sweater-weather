class ShortForecast
  attr_reader :temperature, :conditions

  def initialize(temperature, conditions)
    @temperature = temperature
    @conditions = conditions
  end
end