class FaradayLogger < Faraday::Middleware
  def initialize(app, options = {})
    super(app)

    @app = app
    @logger = options.fetch(:logger) {
      require 'logger'
      ::Logger.new($stdout)
    }
  end

  def call(env)
    @app.call(env).on_complete do
      unless Rails.env.test?
        @logger.info("#{env.status} #{env.method.upcase} #{env.url} #{env.response_headers} #{env.body}")
      end
    end
  end
end
