class MunchiesFacade
  class << self
    def get_json(start, destination, food)
      munchie = Munchie.new(start, destination, food)
    end
  end
end