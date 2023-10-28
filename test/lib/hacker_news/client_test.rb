require "test_helper"

class HackerNews::ClientTest < ActiveSupport::TestCase
  describe "#request" do
    it "executes the HTTP request" do
      stub_request(:get, "https://hacker-news.firebaseio.com/").
          to_return(body: "{}")

      HackerNews::Client.new(base_url: Figaro.env.hacker_news_url).request(:get, "")

      assert_requested :get, "https://hacker-news.firebaseio.com/"
    end

    it "repackages Faraday::ConnectionFailed into HackerNews::ConnectionError" do
      stub_request(:get, "https://hacker-news.firebaseio.com/")
          .to_raise(Faraday::ConnectionFailed)

      assert_raises HackerNews::ConnectionError, "HackerNews connection failed" do
        HackerNews::Client.new(base_url: Figaro.env.hacker_news_url).request(:get, "")
      end
    end

    it "repackages Faraday::TimeoutError into HackerNews::ConnectionError" do
      stub_request(:get, "https://hacker-news.firebaseio.com/")
          .to_raise(Faraday::TimeoutError)

      assert_raises HackerNews::ConnectionError, "HackerNews connection timeout" do
        HackerNews::Client.new(base_url: Figaro.env.hacker_news_url).request(:get, "")
      end
    end

    it "repackages Faraday::SSLError into HackerNews::SSLError" do
      stub_request(:get, "https://hacker-news.firebaseio.com/")
          .to_raise(Faraday::SSLError.new(errmsg = "SSL_connect SYSCALL returned=5 errno=0 state=SSLv3/TLS write finished"))

      assert_raises HackerNews::SSLError, errmsg do
        HackerNews::Client.new(base_url: Figaro.env.hacker_news_url).request(:get, "")
      end
    end
  end
end
