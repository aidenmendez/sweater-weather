require "./lib/modules/timestampable"

class Hourly
  include Timestampable

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
end