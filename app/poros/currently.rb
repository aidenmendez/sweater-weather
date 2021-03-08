require "./lib/modules/timestampable"

class Currently
  include Timestampable

  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feeks_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
    @datetime = format_datetime(data[:dt])
    @sunrise = format_datetime(data[:sunrise])
    @sunset = format_datetime(data[:sunset])
    @temperature = data[:temp]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end