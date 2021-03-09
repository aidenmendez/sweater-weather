class Credit
  attr_reader :author, :source

  def initialize(username)
    @author = username
    @source = "www.unsplash.com"
  end
end