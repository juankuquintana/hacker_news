if Rails.env.production?
  options = {
    url: Figaro.env.redis_url,
    ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
  }
else
  options = {
    host: Figaro.env.redis_host,
    port: Figaro.env.redis_port,
    ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
  }
end

Sidekiq.configure_server do |config|
  config.redis = options
end

Sidekiq.configure_client do |config|
  config.redis = options
end
