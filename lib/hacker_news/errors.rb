module HackerNews

  module Error
  end

  class HackerNewsError < StandardError
    include Error
  end

  # A unified error for failed connections.
  class ConnectionError < HackerNewsError
  end

  # A unified error for SSL errors.
  class SSLError < HackerNewsError
  end
end
