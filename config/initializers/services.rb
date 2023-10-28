require 'hacker_news'

Rails.application.reloader.to_prepare do
  HackerNews::Client.default_client = HackerNews::Client.new(
      base_url: Figaro.env.hacker_news_url,
    )
end
