class ShortForecast
  attr_reader :temperature, :conditions

  def initialize(temperature = nil, conditions = nil)
    @temperature = temperature
    @conditions = conditions
  end
end