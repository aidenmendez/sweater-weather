module Timestampable
  def format_datetime(unix)
    Time.at(unix)
  end
end
