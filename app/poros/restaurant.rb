class Restaurant
  def initialize(data)
    @name = data[:name]
    @address = data[:location][:display_address][0]
  end
end