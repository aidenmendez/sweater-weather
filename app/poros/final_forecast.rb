class FinalForecast
  def initialize(data)
    @summary = data[:summary]
    @temperature = data[:temperature]
  end
end