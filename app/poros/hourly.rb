class Hourly
  attr_reader :datetime,
              :temperature,
              :conditions,
              :icon


  def initialize(data)
    @datetime = format_datetime(data[:dt])
    @temperature = data[:temp]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end

  private

  def format_datetime(unix)
    Time.at(unix)
  end
end