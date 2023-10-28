$redis = Redis.new(host: Figaro.env.redis_host, port: Figaro.env.redis_port, ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })
