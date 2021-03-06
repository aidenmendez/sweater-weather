class DirectionsFacade
  class << self
    def get_directions(origin, destination)
      data = DirectionsService.get_data(origin, destination)
      
      if data[:info][:statuscode] == 402
        { 
          :start_city => origin,
          :end_city => destination,
          :travel_time => "impossible"
        }
      else
        { 
          :start_city   => "#{data[:route][:locations][0][:adminArea5]}, #{data[:route][:locations][0][:adminArea3]}",
          :end_city     => "#{data[:route][:locations][1][:adminArea5]}, #{data[:route][:locations][1][:adminArea3]}",
          :travel_time  => data[:route][:realTime]
         }
      end

    end
  end
end