if Rails.env.production?
  $redis = Redis.new(url: Figaro.env.redis_url, ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })
else
  $redis = Redis.new(host: Figaro.env.redis_host, port: Figaro.env.redis_port, ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })
end
